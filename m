From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/7] x86/ACPI: also parse AMD IOMMU tables
 early
Date: Fri, 29 Mar 2019 03:00:18 -0600
Message-ID: <5C9DDEA20200007800222B35@prv1-mh.provo.novell.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDF140200007800222844@prv1-mh.provo.novell.com>
 <782ef70b-2569-9814-da88-34ad8c98d9c8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9nN9-0001jG-Ft
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 09:00:23 +0000
In-Reply-To: <782ef70b-2569-9814-da88-34ad8c98d9c8@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDE3OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDMvMjAxOSAxNDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEluIG9yZGVy
IHRvIGJlIGFibGUgdG8gaW5pdGlhbGl6ZSB4MkFQSUMgbW9kZSB3ZSBuZWVkIHRvIHBhcnNlCj4+
IHJlc3BlY3RpdmUgQUNQSSB0YWJsZXMgZWFybHkuIFNwbGl0IGFtZF9pb3ZfZGV0ZWN0KCkgaW50
byB0d28gcGFydHMgZm9yCj4+IHRoaXMgcHVycG9zZSwgYW5kIGNhbGwgdGhlIGluaXRpYWwgcGFy
dCBlYXJsaWVyIG9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpUaGFua3MuCgo+PiBAQCAtMTQ1LDYgKzE0NiwxNSBAQCBleHRlcm4gdTMy
IHBtdG1yX2lvcG9ydDsKPj4gIGV4dGVybiB1bnNpZ25lZCBpbnQgcG10bXJfd2lkdGg7Cj4+ICAK
Pj4gIGludCBhY3BpX2RtYXJfaW5pdCh2b2lkKTsKPj4gK2ludCBhY3BpX2l2cnNfaW5pdCh2b2lk
KTsKPj4gKwo+PiArc3RhdGljIGlubGluZSBpbnQgYWNwaV9pb21tdV9pbml0KHZvaWQpCj4+ICt7
Cj4+ICsgICAgaW50IHJldCA9IGFjcGlfZG1hcl9pbml0KCk7Cj4+ICsKPj4gKyAgICByZXR1cm4g
cmV0ID09IC1FTk9ERVYgPyBhY3BpX2l2cnNfaW5pdCgpIDogcmV0Owo+PiArfQo+PiArCj4gCj4g
SSBzdXBwb3NlIHdlIHJlYWxseSBkb24ndCBoYXZlIGFueSBiZXR0ZXIgb3B0aW9uIGhlcmUgdGhh
biB0byB0cnkgZm9yCj4gYWxsIEFQQ0kgdGFibGVzIHdlIG1heSBiZSBpbnRlcmVzdGVkIGluLiAg
SSBjZXJ0YWlubHkgY2FuJ3QgdGhpbmsgb2YgYW55Cj4gaWRlbnRpZnlpbmcgaW5mb3JtYXRpb24g
d2UgY291bGQgdXNlZnVsbHkgc3dpdGNoKCkgb24gaW5zdGVhZC4KClllYWgsIEkndmUgYmVlbiB0
cnlpbmcgdG8gdGhpbmsgb2Ygc29tZSB3YXkgdG8gc2Vuc2libHkgYXZvaWQKZWl0aGVyIG9mIHRo
ZSBhdHRlbXB0cywgYnV0IGtleWluZyB0aGlzIG9mZiBvZiB0aGUgQ1BVIHZlbmRvcgpkb2Vzbid0
IHNlZW0gcmlnaHQuIFNpbmNlIHdlIGNhbid0IHRvbGVyYXRlIGEgbWl4dHVyZSBvZiBJT01NVXMs
CnRoZSBhYm92ZSBzZWVtZWQgdGhlIG1vc3QgcmVhc29uYWJsZSB0aGluZyB3ZSBjYW4gZG8sIHRo
dXMKZW5zdXJpbmcgdGhhdCBldmVuIGluIGEgc3RyYW5nZSAodmlydHVhbGl6ZWQ/KSBlbnZpcm9u
bWVudAp3aGVyZSBib3RoIHRhYmxlcyBleGlzdCB3ZSdkIGVuYWJsZSBvbmx5IG9uZSBvZiB0aGUg
dHdvIGtpbmRzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
