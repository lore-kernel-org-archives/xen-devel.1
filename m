From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] SUPPORT.md: Clarify stubdomain support
Date: Tue, 6 Mar 2018 18:08:44 +0000
Message-ID: <20180306180844.nneworgmxopgf5kc@citrix.com>
References: <20180306170843.19409-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=frmi=f4=citrix.com=prvs=596ef9ce0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1etH16-000657-Nj
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 18:08:48 +0000
Content-Disposition: inline
In-Reply-To: <20180306170843.19409-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMDYsIDIwMTggYXQgMDU6MDg6NDNQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBXZSBkb24ndCBwcm9taXNlIHRvIHByb3RlY3QgeW91IGFnYWluc3Qgcm9ndWUgc3R1
YiBkb21haW4gYmluYXJpZXM7Cj4gb25seSBmcm9tIHRoZSBydW5uaW5nIGRvbWFpbiBvbmNlIHRo
ZSBndWVzdCBoYXMgY29tZSB1cC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IEND
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENDOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+
IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEtv
bnJhZCBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICBTVVBQT1JULm1kIHwgNSArKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQubWQg
Yi9TVVBQT1JULm1kCj4gaW5kZXggYTE4MTBiODA0Ni4uY2U5ZjY4ZTFjMiAxMDA2NDQKPiAtLS0g
YS9TVVBQT1JULm1kCj4gKysrIGIvU1VQUE9SVC5tZAo+IEBAIC01MDEsNiArNTAxLDExIEBAIGZv
ciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHNlY3VyaXR5IHN1cHBvcnQuCj4gIAo+ICAgICAgU3Rh
dHVzOiBTdXBwb3J0ZWQsIHdpdGggY2F2ZWF0cwo+ICAKPiArT25seSBzdHViIGRvbWFpbiBiaW5h
cmllcyBwcm92aWRlZCBieSB0aGUgaG9zdCBhZG1pbgo+ICtvciB0cnVzdGVkIHVzZXJzIGFyZSBz
ZWN1cml0eSBzdXBwb3J0ZWQ7CgpJJ20gbm90IHN1cmUgSSBmb2xsb3cgLS0gd2h5IHdvdWxkIC8g
c2hvdWxkIHVwc3RyZWFtIHN1cHBvcnQgYSBiaW5hcnkKdGhhdCBpcyBub3QgcHJvZHVjZWQgZnJv
bSB1cHN0cmVhbSBzb3VyY2UgY29kZT8KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
