// Tests in this file are run in the PR pipeline and the continuous testing pipeline
package test

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testschematic"
)

// Use existing resource group
const resourceGroup = "geretain-test-resources"
const tfFullstackDADir = "solutions/tf-fullstack-da"

/*******************************************************************
* TESTS FOR THE TERRAFORM BASED FULLSTACK DEPLOYABLE ARCHITECTURE  *
*******************************************************************/

func setupFullstackDAOptions(t *testing.T, prefix string) *testschematic.TestSchematicOptions {

	options := testschematic.TestSchematicOptionsDefault(&testschematic.TestSchematicOptions{
		Testing: t,
		Prefix:  prefix,
		TarIncludePatterns: []string{
			"*.tf",
			fmt.Sprintf("%s/*.tf", tfFullstackDADir),
		},
		// This is the resource group that the workspace will be created in
		ResourceGroup:          resourceGroup,
		TemplateFolder:         tfFullstackDADir,
		Tags:                   []string{"test-schematic"},
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 60,
	})

	// Terraform Variables
	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{
			Name:     "ibmcloud_api_key",
			Value:    options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"],
			DataType: "string",
			Secure:   true,
		},
		{
			Name:     "resource_group_name", // use options.Prefix here to generate a unique prefix every time so resource group name is unique for every test
			Value:    options.Prefix,        // unique per test
			DataType: "string",
		},
	}

	return options
}

// Set up a schematics test
func TestRunFullstackDASchematis(t *testing.T) {
	t.Parallel()

	// Set up options using the reusable setup function
	options := setupFullstackDAOptions(t, "tf-full-da")

	// Run the schematics test
	err := options.RunSchematicTest()
	assert.NoError(t, err, "Schematic Test had unexpected error")
}

// Set up a schematics upgrade test
func TestRunFullstackDASchematicsUpgrade(t *testing.T) {
	t.Parallel()

	options := setupFullstackDAOptions(t, "tf-full-da-upg")
	options.CheckApplyResultForUpgrade = true

	// Run the upgrade test
	err := options.RunSchematicUpgradeTest()
	if !options.UpgradeTestSkipped {
		assert.NoError(t, err, "Fullstack DA upgrade test should complete without errors")
	}
}

/*******************************************************************
* TESTS FOR THE TERRAFORM BASED EXTENSION DEPLOYABLE ARCHITECTURE  *
*******************************************************************/

// TODO: Add tests
