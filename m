From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/libfsimage: Add `XEN' to environment
 variable name
Date: Tue, 5 Mar 2019 15:56:53 +0000
Message-ID: <20190305155653.ru3geabg2otgnbrx@zion.uk.xensource.com>
References: <34d7e71d-f3c4-c236-0247-4cc4f132a2e9@suse.com>
 <20190305153730.28523-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Y1m=RI=citrix.com=prvs=960e31256=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1CRF-00044t-N2
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 15:57:05 +0000
Content-Disposition: inline
In-Reply-To: <20190305153730.28523-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMDUsIDIwMTkgYXQgMDM6Mzc6MzBQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBsaWJyYXJ5LCB3aGljaCBpcyBwcml2YXRlIHRvIFhlbiBhbmQgd2FzIHByb3Bl
cmx5IG5hbWVzcGFjZWQgaW4KPiAgIDFhODE0NzExODgxYmViMTdmMDczZjVmNTdlMjdlNWJkNGRh
MWI5NTYKPiAgIHRvb2xzL2xpYmZzaW1hZ2U6IEFkZCBgeGVuJyB0byAuaCBuYW1lcyBhbmQgcHJp
bmNpcGFsIC5zbyBuYW1lCj4gaG9ub3VycyBhbiBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byBvdmVy
cmlkZSB0aGUgZGlyZWN0b3J5IHdoZXJlCj4gc2hhcmVkIG9iamVjdHMgKGllIGZpbGVzeXN0ZW0g
cGx1Z2lucykgYXJlIHRvIGJlIGxvYWRlZCBmcm9tLgo+IAo+IFJlbmFtZSB0aGF0IHZhcmlhYmxl
IGZyb20gRlNJTUFHRV9GU0RJUiB0byBYRU5fRlNJTUFHRV9GU0RJUiwgdG8gZ2l2ZQo+IGl0IGEg
cHJvcGVyIG5hbWVzcGFjZSBwcmVmaXguCj4gCj4gTm90aGluZyBpbiB4ZW4uZ2l0IHNldHMgdGhp
cyB2YXJpYWJsZS4gIFRoZSB0aHJlZSBoaXRzIGZvciB0aGUgc3RyaW5nCj4gYEZTSU1BR0VfRlNE
SVInIGFyZSB0aGlzIGdldGVudiwgYW5kIHR3byByZWZlcmVuY2VzIHRvIGEgY29tcGlsZS10aW1l
Cj4gbWFuaWZlc3QgY29uc3RhbnQgd2hpY2ggcHJvdmlkZXMgdGhlIGRlZmF1bHQgdmFsdWUgKHRo
ZSAtRCB3aGljaCBzZXRzCj4gaXQsIGFuZCB0aGUgcGxhY2UgaXQgaXMgdXNlZCkuCj4gCj4gSSBo
YXZlIGFsc28gY2hlY2tlZCB0aGUgY3VycmVudCBEZWJpYW4gWGVuIHBhY2thZ2UgaW4gYnVzdGVy
IGFuZCB0aGUKPiB2YXJpYWJsZSBpcyBub3Qgc2V0IHRoZXJlIGVpdGhlci4KPiAKPiBDQzogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDQzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiBDQzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
