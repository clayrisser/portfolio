import Link from 'gatsby-link';
import React, { Component } from 'react';

let Tabs = null;
let Tab = null;

if (typeof window !== 'undefined') {
  ({ Tabs, Tab } = require('carbon-components-react'));
}

export default class Header extends Component {
  render() {
    if (typeof window === 'undefined') return <div />;
    return (
      <div>
        <Tabs>
          <Tab label="Home" />
          <Tab label="Blog" />
          <Tab label="Portfolio" />
        </Tabs>
      </div>
    );
  }
}
