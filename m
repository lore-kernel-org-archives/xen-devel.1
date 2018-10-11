From: Meng Xu <xumengpanda@gmail.com>
Subject: Re: Xen optimization
Date: Thu, 11 Oct 2018 08:39:02 -0700
Message-ID: <CAENZ-+mF5NTu1UAYLoCaiFCWcAPKJu5YGzf5cux6OtOmDr+QQQ@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1yae=mx=gmail.com=xumengpanda@srs-us1.protection.inumbo.net>)
 id 1gAd3t-0007oS-Em
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 15:39:41 +0000
Received: by mail-ot1-x336.google.com with SMTP id l58so9359978otd.6
 for <xen-devel@lists.xenproject.org>; Thu, 11 Oct 2018 08:39:40 -0700 (PDT)
In-Reply-To: <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgTWlsYW4sCgpPbiBUaHUsIE9jdCAxMSwgMjAxOCBhdCAxMjozNiBBTSBNaWxhbiBCb2Jlcmlj
IDxtaWxhbmJvYmVyaWM5NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgMTAsIDIw
MTggYXQgNjo0MSBQTSBNZW5nIFh1IDx4dW1lbmdwYW5kYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4K
PiA+IFRoZSBqaXR0ZXIgbWF5IGNvbWUgZnJvbSBYZW4gb3IgdGhlIE9TIGluIGRvbTAuCj4gPiBJ
dCB3aWxsIGJlIHVzZWZ1bCB0byBrbm93IHdoYXQgaXMgdGhlIGppdHRlciBpZiB5b3UgcnVuIHRo
ZSB0ZXN0IG9uIFBldGFMaW51eC4KPiA+IChJdCdzIHVuZGVyc3RhbmRhYmxlIHRoZSBqaXR0ZXIg
aXMgZ29uZSB3aXRob3V0IE9TLiBJdCBpcyBhbHNvIGNvbW1vbgo+ID4gdGhhdCBPUyBpbnRyb2R1
Y2VzIHZhcmlvdXMgaW50ZXJmZXJlbmNlcy4pCj4KPiBIaSBNZW5nLAo+IHdlbGwuLi4gSSdtIHVz
aW5nIGJhcmUtbWV0YWwgYXBwbGljYXRpb24gYW5kIEkgbmVlZCBpdCBleGNsdXNpdmVseSB0bwo+
IGJlIHJhbiBvbiBvbmUgQ1BVIGFzIGRvbVUgKGd1ZXN0KSB3aXRob3V0IE9TIChhbmQgSSdtIG5v
dCBzdXJlIGhvdwo+IHdvdWxkIEkgbWFrZSB0aGUgc2FtZSBhcHAgdG8gYmUgcmFuIG9uIFBldGFM
aW51eCBkb20wIDpEIGhhaGEpLgo+IElzIHRoZXJlIGEgY2hhbmNlIHRoYXQgUGV0YUxpbnV4IGFz
IGRvbTAgaXMgY3JlYXRpbmcgdGhpcyBqaXR0ZXIgYW5kCj4gaG93PyBJcyB0aGVyZSBhIHdheSBv
ZiBkZWNyZWFzaW5nIGl0PwoKSSdtIG5vdCBmYW1pbGlhciB3aXRoIFBldGFMaW51eC4gOigKRnJv
bSBteSBwcmV2aW91cyBleHBlcmllbmNlIGluIG1lYXN1cmluZyB0aGUgcnQtdGVzdCBpbiB0aGUK
dmlydHVhbGl6YXRpb24gZW52aXJvbm1lbnQsIEkgZm91bmQ6CkV2ZW4gdGhvdWdoIHRoZSBhcHAu
IGlzIHRoZSBvbmx5IG9uZSBydW5uaW5nIG9uIHRoZSBDUFUsIHRoZSBDUFUgbWF5CmJlIHVzZWQg
dG8gaGFuZGxlIG90aGVyIGludGVycnVwdHMgYW5kIGl0cyBjb250ZXh0IChzdWNoIGFzIFRMQiBh
bmQKY2FjaGUpIG1pZ2h0IGJlIGZsdXNoZWQgYnkgb3RoZXIgY29tcG9uZW50cy4gV2hlbiB0aGVz
ZSBoYXBwZW4sIHRoZQppbnRlcnJ1cHQgaGFuZGxpbmcgbGF0ZW5jeSBjYW4gdmFyeSBhIGxvdC4K
CkhvcGVmdWxseSwgaXQgaGVscHMuIDopCgpNZW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
