From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/hpet: Fix possible ASSERT(cpu <
 nr_cpu_ids)
Date: Wed, 18 Apr 2018 09:49:38 -0600
Message-ID: <5AD7691202000078001BC732@prv1-mh.provo.novell.com>
References: <1524043539-2576-1-git-send-email-Davidwang@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iali=hh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f8pKx-00054Y-Ck
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 15:49:35 +0000
In-Reply-To: <1524043539-2576-1-git-send-email-Davidwang@zhaoxin.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Davidwang <Davidwang@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Fiona Li(BJ-RD)" <FionaLi@zhaoxin.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDExOjI1LCA8RGF2aWR3YW5nQHpoYW94aW4uY29tPiB3cm90ZToK
PiBGcm9tOiBEYXZpZCBXYW5nIDxkYXZpZHdhbmdAemhhb3hpbi5jb20+Cj4gCj4gRm9yIHRoZSBj
aC0+Y3B1bWFzayBiZSBjbGVhcmVkIGJ5IG90aGVyIGNwdSwgY3B1bWFza19maXJzdCgpIGNhbGxl
ZCBieQo+IGhwZXRfZGV0YWNoX2NoYW5uZWwoKSByZXR1cm4gbnJfY3B1X2lkcy4gVGhhdCBsZWFk
IGFuIGFzc2VydGlvbiBpbgo+IHNldF9jaGFubmVsX2lycV9hZmZpbml0eSgpIHdoZW4gY3B1bWFz
a19vZigpIGNoZWNrIGNwdS4KPiBGaXggdGhpcyBieSB1c2luZyBhIGxvY2FsIHZhcmlhYmxlLgoK
VGhlIGZpeCBpc24ndCB0byB1c2UgYSBsb2NhbCB2YXJpYWJsZSwgaW50cm9kdWNpbmcgYSBsb2Nh
bCB2YXJpYWJsZSBpcyBvbmx5IGEKdmVoaWNsZSBmb3IgYWRkcmVzc2luZyB0aGUgYnVnLiBBbHNv
IEknbSBhZnJhaWQgSSBzdGlsbCBjYW4ndCBtYWtlIG11Y2gKc2Vuc2Ugb2YgdGhlIGZpcnN0IHNl
bnRlbmNlOyBpdCBvbmx5IGlzIHRoYXQgbm93IEkga25vdyB3aGF0IHlvdSB3YW50CnRvIGZpeC4K
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2hwZXQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ocGV0LmMK
PiBAQCAtNTA5LDE1ICs1MDksMTggQEAgc3RhdGljIHZvaWQgaHBldF9hdHRhY2hfY2hhbm5lbCh1
bnNpZ25lZCBpbnQgY3B1LAo+ICBzdGF0aWMgdm9pZCBocGV0X2RldGFjaF9jaGFubmVsKHVuc2ln
bmVkIGludCBjcHUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGhw
ZXRfZXZlbnRfY2hhbm5lbCAqY2gpCj4gIHsKPiArICAgIGNwdW1hc2tfdCBjcHVtYXNrOwoKTm8s
IGNlcnRhaW5seSBub3QuIFdlIGRvbid0IHdhbnQgdmFyaWFibGVzIG9mIHRoYXQgdHlwZSBvbiB0
aGUgc3RhY2suClJlY2FsbCB0aGF0IGluIHYxIHJldmlldyBJIHdyb3RlICJob3cgYWJvdXQgZWxp
bWluYXRpbmcgdGhlCmNwdW1hc2tfZW1wdHkoKSBjYWxsIGluIGZhdm9yIG9mIGp1c3QgdGhlIGNw
dW1hc2tfZmlyc3QoKSIuIFRoZSBsb2NhbAp2YXJpYWJsZSB0byBpbnRyb2R1Y2UgaXMgdG8gaG9s
ZCB0aGUgcmVzdWx0IG9mIGNwdW1hc2tfZmlyc3QoKS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
