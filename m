From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [Minios-devel] automation: Creating a patchwork
 instance to improve pre-commit build testing
Date: Tue, 24 Jul 2018 09:44:03 -0600
Message-ID: <5B57494302000078001D75A6@prv1-mh.provo.novell.com>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
 <A926ADEA-FB93-4AE8-9529-09F429FC8E3B@citrix.com>
 <tza4s2sh48vopp.fsf@N-1128.office.hd>
 <5B5714C102000078001D72E6@prv1-mh.provo.novell.com>
 <BD4DCDDD-FECC-40D6-BD0F-BF1D79237662@citrix.com>
 <e3c23c76-5a40-19b6-ee82-063d950861d3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgmm=ki=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fhzTs-00026y-IW
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 15:44:08 +0000
In-Reply-To: <e3c23c76-5a40-19b6-ee82-063d950861d3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Lars Kurth <lars.kurth@citrix.com>, Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Yuri Volchkov <yuri.volchkov@neclab.eu>, Minios-devel <minios-devel@lists.xenproject.org>, committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA3LjE4IGF0IDE2OjAxLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBJIGRvbid0IHNlZSB3aGF0IHRoZSBwcm9ibGVtIGlzIGluIGhhdmluZyBhIHNpbmdsZSBy
ZXNwb25zZSB0byB0aGUKPiB0aHJlYWQgc2F5aW5nIHRoYXQgdGhlIHRlc3Qgd2FzIHJ1biwgdGhl
IHJlc3VsdCBvZiB0aGUgcnVuLCBhbmQgYSBsaW5rCj4gdG8gYSBwYWdlIGFib3V0IGl0LiAgSXQn
cyBjZXJ0YWlubHkgbGVzcyBtYWlsIHRoYW4gSSBnZXQgaW4gdGhlIGNvdXJzZQo+IG9mIGEgbm9y
bWFsIHJldmlldyBjeWNsZSBhYm91dCBwYXRjaCBzZXJpZXMgSSdtIG5vdCBpbnRlcmVzdGVkIGlu
Lgo+IAo+IEkgbWVhbiwgc3VwcG9zZSB3ZSBqdXN0IGhhZCBhIHJlYWxseSBlbnRodXNpYXN0aWMg
Y29udHJpYnV0b3Igd2hvIG1hZGUKPiBpdCB0aGVpciBwZXJzb25hbCBnb2FsIHRvIHRlc3QgYW5k
IGJ1aWxkIGV2ZXJ5IHBhdGNoIHRoYXQgd2FzIHNlbnQgdG8KPiB0aGUgbGlzdC4gIFdvdWxkIGFu
eW9uZSByZWFsbHkgY29tcGxhaW4gYWJvdXQgYSBzaW5nbGUgZXh0cmEgbWFpbCBwZXIKPiBzZXJp
ZXMsIHdoZW4gYSB0eXBpY2FsIHNlcmllcyBnZW5lcmF0ZXMgZG96ZW5zIG9mIGh1bWFuLWdlbmVy
YXRlZCBtYWlscwo+IGFueXdheT8KCldlbGwsIEkgYWdyZWUgb25lIGNhbiB2aWV3IGF0IHRoaXMg
ZnJvbSBkaWZmZXJlbnQgYW5nbGVzLiBZb3VyCnBlcnNwZWN0aXZlIGxvb2tzIHRvIGJlIHRoYXQg
d2l0aCB0aGVyZSBhbHJlYWR5IGJlaW5nIHNvIG11Y2gKbWFpbCwgYSBsaXR0bGUgbW9yZSBkb2Vz
bid0IGh1cnQuIEknbSBvbiB0aGUgcG9zaXRpb24gdGhhdCBldmVyeQp1bm5lY2Vzc2FyeSBtYWls
IGlzIGEgcHJvYmxlbS4gRm9yIChsb25nKSBzZXJpZXMgdGhlIG9uZSBleHRyYQptYWlsIHBlcmhh
cHMgaXMgaW5kZWVkIG5vdCBvbmx5IHRvbGVyYWJsZSBidXQgaGVscGZ1bCAoYWxiZWl0IGV2ZW4K
dGhlcmUgaXQgd291bGQgcmF0aGVyIGJlIG9uZSBtYWlsIHBlciB2ZXJzaW9uLCB3aGljaCBtYXkK
YmVjb21lIGluY3JlYXNpbmdseSBwb2ludGxlc3MgYXMgb25seSB2ZXJ5IHNtYWxsIGNoYW5nZXMg
Z2V0CmRvbmUgYmV0d2VlbiB2ZXJzaW9ucykuIEZvciBpbmRpdmlkdWFsIHBhdGNoZXMgKG9uZSBs
aW5lcnMgdG8KdGFrZSB0aGUgZXh0cmVtZSkgdGhlcmUgb2Z0ZW4gaXMganVzdCBhIHNpbmdsZSBy
ZXNwb25zZSB3aXRoIGFuCmFjay4gVGhlIGJvdCB3b3VsZCBpbmNyZWFzZSB0aGF0IHZvbHVtZSBi
eSBhIHdob3BwaW5nIDUwJQoob3IgMTAwJSBmb3IgYW55b25lIGZvciB0aGVpciBvd24gcGF0Y2hl
cykuCgpXaXRoIGFsbCB0aGlzIHNhaWQsIGp1c3QgdG8gYmUgY2xlYXI6IEknbSBub3QgYWdhaW5z
dCBpbXByb3ZlbWVudHMKaGVyZSBvciBhbnl3aGVyZSBlbHNlLCBidXQgdGhlaXIgcHJpY2UgbmVl
ZHMgdG8gYmUgcmVhc29uYWJsZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
