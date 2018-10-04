From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/4] x86: split opt_pv_l1tf
Date: Thu, 04 Oct 2018 04:03:06 -0600
Message-ID: <5BB5E55A02000078001EE342@prv1-mh.provo.novell.com>
References: <5BB20CE602000078001ED341@prv1-mh.provo.novell.com>
 <5BB20E8D02000078001ED368@prv1-mh.provo.novell.com>
 <da96d011-e3ed-b2d4-63a2-505c0617555e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z6fo=mq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g80TM-0006uz-9n
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 10:03:08 +0000
In-Reply-To: <da96d011-e3ed-b2d4-63a2-505c0617555e@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjEwLjE4IGF0IDE4OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMTAvMTggMTM6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBVc2Ugc2VwYXJh
dGUgdHJhY2tpbmcgdmFyaWFibGVzIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBEb21VLXMu
Cj4+Cj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLCBidXQgYWRqdXN0IHRoZSBjb21t
ZW50IGluCj4+IGluaXRfc3BlY3VsYXRpb25fbWl0aWdhdGlvbnMoKSB0byBtYXRjaCBwcmlvciBh
cyB3ZWxsIGFzIHJlc3VsdGluZyBjb2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+LCBidXQgd2l0aCBvbmUKPiBzdWdnZXN0ZWQgZGVsZXRpb24u
Cj4gCj4+IEBAIC04ODksMTggKzg5MiwxNiBAQCB2b2lkIF9faW5pdCBpbml0X3NwZWN1bGF0aW9u
X21pdGlnYXRpb25zCj4+ICAKPj4gICAgICAvKgo+PiAgICAgICAqIEJ5IGRlZmF1bHQsIGVuYWJs
ZSBQViBkb21VIEwxVEYgbWl0aWdhdGlvbnMgb24gYWxsIEwxVEYtdnVsbmVyYWJsZQo+PiAtICAg
ICAqIGhhcmR3YXJlLCBleGNlcHQgd2hlbiBydW5uaW5nIGluIHNoaW0gbW9kZS4KPj4gKyAgICAg
KiBoYXJkd2FyZSwgZXhjZXB0IHdoZW4gcnVubmluZyBpbiBzaGltIG1vZGUsIGFuZCAtIGF0IGxl
YXN0IGZvciB0aGUKPj4gKyAgICAgKiB0aW1lIGJlaW5nIC0gYWxzbyBleGNlcHRpbmcgdGhlIGhh
cmR3YXJlIGRvbWFpbi4KPiAKPiBJJ20gbm90IHN1cmUgdGhpcyBhZGRpdGlvbiBpcyBoZWxwZnVs
LiAgV2UgYWxyZWFkeSBzdGF0ZSBQViBkb21VIGFib3ZlLgoKT2gsIHJpZ2h0IHlvdSBhcmUgLSBz
b21laG93IEkgZGlkbid0IHBheSBlbm91Z2ggYXR0ZW50aW9uIHRvIHRoZSBVLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
