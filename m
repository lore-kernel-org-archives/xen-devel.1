From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/7] doc: add architecture qualifier to boot
 parameter entries
Date: Thu, 26 Apr 2018 09:00:55 -0600
Message-ID: <5AE1E9A702000078001BEDC1@prv1-mh.provo.novell.com>
References: <20180424064459.23645-1-jgross@suse.com>
 <20180424064459.23645-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cg6/=hp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fBiOJ-0002VJ-9N
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 15:00:59 +0000
In-Reply-To: <20180424064459.23645-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA0LjE4IGF0IDA4OjQ0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBNYW55
IG9mIHRoZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgYm9vdCBwYXJhbWV0ZXJzIGFyZSBub3QgcXVh
bGlmaWVkCj4gYXMgc3VjaC4gQ29ycmVjdCB0aGF0LgoKSSB0aGluayB3ZSB3YW50IHRvIGRpc3Rp
bmd1aXNoIGJldHdlZW4gb25lcyByZWFsbHkgb25seSBiZSBtZWFuaW5nZnVsIGZvcgpzb21lIGFy
Y2hpdGVjdHVyZSB2cyBvbmVzIHdoaWNoIGFyZSBjdXJyZW50bHkgb25seSBpbXBsZW1lbnRlZCBm
b3IganVzdApvbmUuIEZvciBleGFtcGxlIC4uLgoKPiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1h
bmQtbGluZS5tYXJrZG93bgo+ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtk
b3duCj4gQEAgLTExMCw3ICsxMTAsNyBAQCBkb21haW4gMCBjb21tYW5kIGxpbmUKPiAgU3BlY2lm
eSB3aGljaCBBQ1BJIE1BRFQgdGFibGUgdG8gcGFyc2UgZm9yIEFQSUMgaW5mb3JtYXRpb24sIGlm
IG1vcmUKPiAgdGhhbiBvbmUgaXMgcHJlc2VudC4KPiAgCj4gLSMjIyBhY3BpXF9wc3RhdGVcX3N0
cmljdAo+ICsjIyMgYWNwaVxfcHN0YXRlXF9zdHJpY3QgKHg4NikKPiAgPiBgPSA8Ym9vbGVhbj5g
CgouLi4gSSdtIG5vIHN1cmUgUC1zdGF0ZXMgYXJlIG1lYW5pbmdsZXNzIG9uIEFSTS4gVGhleSdy
ZSBjZXJ0YWlubHkgYSBnZW5lcmFsCkFDUEkgY29uY2VwdCwgYW5kIHdlcmUgc2ltaWxhcmx5IHVz
ZWQgZS5nLiBmb3IgSUE2NC4KCj4gQEAgLTExOSwxMiArMTE5LDEyIEBAIEVuZm9yY2UgY2hlY2tp
bmcgdGhhdCBQLXN0YXRlIHRyYW5zaXRpb25zIGJ5IHRoZSBBQ1BJIGNwdWZyZXEgZHJpdmVyCj4g
IGFjdHVhbGx5IHJlc3VsdCBpbiB0aGUgbm9taW5hdGVkIGZyZXF1ZW5jeSB0byBiZSBlc3RhYmxp
c2hlZC4gQSB3YXJuaW5nCj4gIG1lc3NhZ2Ugd2lsbCBiZSBsb2dnZWQgaWYgdGhhdCBpc24ndCB0
aGUgY2FzZS4KPiAgCj4gLSMjIyBhY3BpXF9za2lwXF90aW1lclxfb3ZlcnJpZGUKPiArIyMjIGFj
cGlcX3NraXBcX3RpbWVyXF9vdmVycmlkZSAoeDg2KQo+ICA+IGA9IDxib29sZWFuPmAKClRoaXMg
b25lLCBvdG9oLCBpcyBmaW5lIHRvIGJlIG5hbWVkIHg4NiBvbmx5LCBhcyBpdCBkZWFscyB3aXRo
IHg4NgpzcGVjaWZpYyBCSU9TIHF1aXJrcy4KCj4gQEAgLTE5OSw3ICsxOTksNyBAQCB0byBiZSBw
ZXJmb3JtZWQgd2l0aG91dCB0aGUgb3ZlcmhlYWQgb2YgYSBjb21wbGV0ZSBUTEIgZmx1c2guCj4g
IEZvcmNlcyBhbGwgQ1BVcycgZnVsbCBzdGF0ZSB0byBiZSBsb2dnZWQgdXBvbiBjZXJ0YWluIGZh
dGFsIGFzeW5jaHJvbm91cwo+ICBleGNlcHRpb25zICh3YXRjaGRvZyBOTUlzIGFuZCB1bmV4cGVj
dGVkIE1DRXMpLgo+ICAKPiAtIyMjIGF0cwo+ICsjIyMgYXRzICh4ODYpCj4gID4gYD0gPGJvb2xl
YW4+YAoKQVRTIGlzIGEgZ2VuZXJhbCBQQ0kgY29uY2VwdCwgc28gSSB3b3VsZG4ndCB3YW50IHRo
aXMgb3B0aW9uIHRvIGJlIHRhZ2dlZAp4ODYgb25seS4KCkp1c3QgdG8gZ2l2ZSBhIGZldyBleGFt
cGxlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
