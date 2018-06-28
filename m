From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: make sure buffer is null-terminated
 in libxl_read_file_contents [and 3 more messages]
Date: Thu, 28 Jun 2018 12:49:40 +0100
Message-ID: <23348.52052.955419.458756@mariner.uk.xensource.com>
References: <1530090791-5210-1-git-send-email-robinlee.sysu@gmail.com>
 <20180627105835.vxkdh6txjm5hheqa@citrix.com>
 <CAG8B0OwkyaEmPSqjf6=ci48r7BRVs1qjdB9dJM+e0Mo4yMY_Hw@mail.gmail.com>
 <20180627112433.42tk4l7jhqweqvwt@citrix.com>
 <CAG8B0Ox4yVuaf3nbLLGw8dNoHoxQ=_q==NvQ=Cop74x7bgKvZw@mail.gmail.com>
 <20180627122926.tqq5cfk3toypmqqq@citrix.com>
 <CAG8B0OwC1m4ZAS5_DUj67SzgR5qgyW3hzb_+ZAatiY6-FGA=Aw@mail.gmail.com>
 <23348.46954.482917.689734@mariner.uk.xensource.com>
 <20180628112021.cz3w3ga3zsxvfyib@citrix.com>
 <23348.51210.927929.595848@mariner.uk.xensource.com>
 <20180628114005.cefc47zlyvxhb55m@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3gz1=jo=citrix.com=prvs=710363d4d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYVQp-0005Ju-8V
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 11:49:47 +0000
In-Reply-To: <20180628114005.cefc47zlyvxhb55m@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Robin Lee <robinlee.sysu@gmail.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBsaWJ4bDogbWFrZSBzdXJl
IGJ1ZmZlciBpcyBudWxsLXRlcm1pbmF0ZWQgaW4gbGlieGxfcmVhZF9maWxlX2NvbnRlbnRzIFth
bmQgMyBtb3JlIG1lc3NhZ2VzXSIpOgo+IE9uIFRodSwgSnVuIDI4LCAyMDE4IGF0IDEyOjM1OjM4
UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gVGhlIG9uZSB0aGF0IHdyaXRlcyBhIG51
bCB0byB0aGUgZmlsZS4gIEkgY2FuJ3QgYmVsaWV2ZSBpdCB3YXMKPiA+IGRlbGliZXJhdGUuICBJ
IGhhdmVuJ3QgbG9va2VkIHRvIGZpbmQgd2hlcmUgaXQgY29tZXMgZnJvbSBidXQgaWYgdGhlCj4g
PiBjb2RlIHdoZXJlIGl0IGNvbWVzIGZyb20gZG9lc24ndCBsb29rIGxpa2UgYW4gb2ZmLWJ5LW9u
ZSBlcnJvciB0aGVuIGl0Cj4gPiBpcyB0b28gb2J0dXNlIDotKS4KPiAKPiBJdCBpcyBkZWxpYmVy
YXRlLiBTZWUgbGlieGxfaW50ZXJuYWwuaDpsaWJ4bF9fc2V0X2RvbWFpbl9jb25maWd1cmF0aW9u
LgoKVGhlIGhlYWRlciBmaWxlIHNheXMgbm90aGluZyBhYm91dCB0aGlzLiAgSXQgc2VlbXMgdG8g
aW1wbHkgdGhhdCB0aGUKZmlsZSBpcyBqc29uLCB3aGljaCwgaWYgaXQgY29udGFpbnMgYSBudWws
IGl0IGlzbid0LiAgSSBkbyBzZWUgdGhhdAp0aGUgaW1wbGVtZW50YXRpb24gZG9lcyBtYWtlIHRo
ZSBvZmYtYnktb25lIG9idmlvdXNseSBkZWxpYmVyYXRlLgoKPiBBdCB0aGUgdGltZSBJIHdyb3Rl
IHRoZSBjb2RlIEkgZGlkbid0IHdhbnQgdG8gY2hhbmdlIHRoZSByZWFkL3dyaXRlCj4gZnVuY3Rp
b24gQVBJcy4gVGhlIGZpbGUgd2FzIC8gaXMgY29uc2lkZXJlZCBpbnRlcm5hbCBhbnl3YXkuCgpJ
IHNlZS4KCldlbGwsIEkgdGhpbmsgdGhlIHJlYWQvd3JpdGUgQVBJIGlzIG5pY2VyIGlmIGl0IGlu
Y2x1ZGVzIGEgdHJhaWxpbmcKbnVsLiAgSVNUUiBzb21lIG90aGVyIGNhbGxlciBvZiB0aG9zZSBm
dW5jdGlvbnMgd2FudGluZyBhIG51bCB0b28uCkFuZCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhl
IGZpbGUgd2VyZSBhY3R1YWwganNvbiwgZXZlbiBpZiBtYW55IGpzb24KYWN0dWFsIHByZXR0eSBw
cmludGVycyB3aWxsIHRvbGVyYXRlIHRoZSBudWwuCgpTbywgbXkgcHJlZmVyZW5jZSB3b3VsZCBi
ZSBmb3IgdGhlIG9yaWdpbmFsIHBhdGNoIHRvIGJlIHJlc3VibWl0dGVkCndpdGggYSBzdW1tYXJ5
IG9mIHRoaXMgdGhyZWFkIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCk1heWJlIGluIHNvbWUgZnV0
dXJlIHJlbGVhc2UsIGFuIGFkZGl0aW9uYWwgcGF0Y2ggdG8gcmVtb3ZlIHRoZSBudWwsCmFsdGhv
dWdoIEkgY2FyZSBhYm91dCB0aGF0IGEgbG90IGxlc3MuICBJIGRvbid0IHNlZSBhbnkgcmVhc29u
IHRvCnJlbW92ZSB0aGUgbnVsIHByb2FjdGl2ZWx5IGdpdmVuIHRoYXQgaXQgbWlnaHQgYnJlYWsg
cGVvcGxlIGRvaW5nCnVuc3VwcG9ydGVkIHRoaW5ncyBsaWtlIGdvaW5nIGJhY2t3YXJkcyB3aXRo
IHRoZWlyIGxpYnhsIHZlcnNpb24uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
