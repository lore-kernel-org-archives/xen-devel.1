From: George Dunlap <dunlapg@umich.edu>
Subject: Re: Is there a faster way to restore Virtual machine
 status in Xen?
Date: Tue, 3 Jul 2018 08:24:38 +0000
Message-ID: <CAFLBxZaD076baok8jEu1h0x9U4KnwDA+knk_n4MRhb7GFbmPbg@mail.gmail.com>
References: <193BC0700AA2F44A8843B8D1C1E6B618D51A7955@nkgeml514-mbx.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sx6z=jt=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1faGc4-0007rg-JC
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 08:24:40 +0000
Received: by mail-qk0-x233.google.com with SMTP id b66-v6so531692qkj.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jul 2018 01:24:39 -0700 (PDT)
In-Reply-To: <193BC0700AA2F44A8843B8D1C1E6B618D51A7955@nkgeml514-mbx.china.huawei.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Chenjia (C)" <chenjia09@huawei.com>
Cc: "wangxu (R)" <wangxu0@huawei.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, zhaobingjian <zhaobingjian@huawei.com>, "Shentao (Terry)" <shentao8@huawei.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMTQsIDIwMTggYXQgMjoyNiBBTSwgQ2hlbmppYSAoQykgPGNoZW5qaWEwOUBo
dWF3ZWkuY29tPiB3cm90ZToKPiBEZWFyIFhFTiBleHBlcnTvvJoKPgo+ICAgICAgICAgICAgIFdl
IG1lZXQgc29tZSBwcm9ibGVtIGluIG91ciBwcm9qZWN0OiBJbiBvdXIgcHJldmlvdXMgcHJvamVj
dCwgd2UKPiB1c2UgS1ZNLCBhbmQgd2UgZG8gc29tZSBqb2IgbGlrZSB0aGlzOgo+Cj4KPgo+IFdl
IGNyZWF0ZSBLVk0gc25hcHNob3QgYnkg4oCcdmlyc2ggc25hcHNob3QtY3JlYXRlICREb21haW5O
YW1lICRTbmFwc2hvdFhtbOKAnSwKPiB0aGVuIGRvIGZvbGxvd2luZyBqb2I6Cj4KPiBXaGlsZSgx
KQo+Cj4gewo+Cj4gUnVuIOKAnHZpcnNoIHNuYXBzaG90LXJldmVydCAkRG9tYWluTmFtZSAgJFNu
YXBzaG90IC0tcnVubmluZyAtLWZvcmNl4oCdCj4KPiBEbyBzb21lIGpvYiBpbiAzMCBzZWNlbmRz
Cj4KPiB9Cj4KPgo+Cj4KPgo+ICAgICAgICAgICAgIE5vdyBvdXIgcHJvamVjdCBpcyBtb3ZlIHRv
IFhlbiwgc28gd2UgbmVlZCB0byBkbyBzYW1lIHRoaW5nIGxpa2UKPiBpbiBLVk0sIGJ1dCB3ZSBm
b3VuZCB0aGF0IHRoZXJlIGlzIG5vIOKAnFNuYXBzaG904oCdIGluIHhlbiAsIHNvIHdlIGNoYW5n
ZSB0aGUKPiBqb2IgbGlrZSB0aGlzIGluIHhlbjoKPgo+ICAgICAgICAgICAgIFdoaWxlKDEpCj4K
PiB7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBSdW4g4oCceGwgZGVzdHJveSB3aW43X2No
ZWNrcG9pbnRGaWxl4oCdCj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBSdW4g4oCceGwgcmVz
dG9yZSAgd2luN19jaGVja3BvaW50RmlsZeKAnQo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
RG8gc29tZSBqb2IgaW4gMzAgc2VjZW5kcwo+Cj4gfQo+Cj4KPgo+ICAgICAgICAgICAgIFdlIGZv
dW5kIHRoYXTigJ0geGwgZGVzdHJveSDigJxhbmQg4oCceGwgcmVzdG9yZeKAnSBzcGVuZCAxMCB0
aW1lcwo+IGxvbmdlciB0aGFuIOKAnHZpcnNoIHNuYXBzaG90LXJldmVydOKAnSwgIGl0IGlzIHVu
YWNjZXB0YWJsZSBpbiBvdXIgcHJvamVjdAo+Cj4KPgo+ICAgICAgICAgICAgIFNvIG91ciBxdWVz
dGlvbiBpcyB0aGF0OiBJcyB0aGVyZSBhIGZhc3RlciB3YXkgdG8gcmVzdG9yZQo+IFZpcnR1YWwg
bWFjaGluZSBzdGF0dXMgaW4gWGVuPwoKSW50ZXJuYWxseSBYZW4gaGFzIHRoZSBjb3B5LW9uLXdy
aXRlIGZ1bmN0aW9uYWxpdHkgbmVlZGVkIHRvIGltcGxlbWVudApmYXN0ZXIgc25hcHNob3RzOyBi
dXQgd2UgZG9uJ3QgaGF2ZSB0aGUgdG9vbGluZyB5ZXQuICBJZiB5b3UncmUga2Vlbgplbm91Z2gg
eW91IGNvdWxkIGltcGxlbWVudCBpdCAtLSBidXQgaWYgeW91IGRvbid0IGhhdmUgdGhlIHRpbWUg
LwplZmZvcnQgdG8gZG8gdGhhdCBJJ20gYWZyYWlkIHlvdSdyZSBvdXQgb2YgbHVjay4KCiAtR2Vv
cmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
