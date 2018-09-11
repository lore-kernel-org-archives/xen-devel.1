From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 15:27:06 +0100
Message-ID: <31c99bb6-3417-ad7a-03d8-480edd26dbb8@citrix.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <5B97868502000078001E712B@prv1-mh.provo.novell.com>
 <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
 <5B97886002000078001E7151@prv1-mh.provo.novell.com>
 <8f79f39e-a8ef-36e8-aa0e-46d444cefb3c@epam.com>
 <5B978B2A02000078001E71A0@prv1-mh.provo.novell.com>
 <6a52ae76-5863-9c27-a605-0eec9aa34c1f@epam.com>
 <18c5a856-1291-1096-c7be-9bbcb64d67ab@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tpi7=lz=citrix.com=prvs=785918234=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fzjdH-0007AF-Uv
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 14:27:11 +0000
In-Reply-To: <18c5a856-1291-1096-c7be-9bbcb64d67ab@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAwMzowNCBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBTbyB3aGF0IHdv
dWxkIGJlIHRoZSBjb25jbHVzaW9uPwo+IAo+IEknbSBnb2luZyB0byBjaGFuZ2UgdGltZXN0YW1w
cyBmb3JtYXQgdG8gZGVjaW1hbCBmb3IgYWxsIGtleWhhbmRsZXJzLgo+IEJ1dCB3aGF0IGFib3V0
IHRoZSBmb3JtYXQgaXRzZWxmPyBEb2VzIGV4aXN0aW5nIHBsYWluIG5zIFBSSV9zdGltZSBoYXZl
Cj4gYSBjaGFuY2UgdG8gYmUgYWNrZWQ/Cj4gCj4gT3Igc2hvdWxkIEkgdGhpbmsgb2YgYW4gZXh0
ZW5kZWQgZm9ybWF0IChzZWNvbmRzIHdpdGggZnJhY3Rpb25zLCBtcyB3aXRoCj4gZnJhY3Rpb25z
KT8KCkkgYW0gaGFwcHkgd2l0aCB0aGUgY3VycmVudCBQUklfc3RpbWUuICBJZiB5b3Ugc2VudCBz
dWNoIGEgcGF0Y2ggSSB3b3VsZApBY2sgaXQgYW5kIGFyZ3VlIGZvciBpdCB0byBiZSBhY2NlcHRl
ZC4gIChXaGV0aGVyIEkgd291bGQgcHJldmFpbCwgb2YKY291cnNlLCBpcyBhIGRpZmZlcmVudCBx
dWVzdGlvbi4pCgpJIHRoaW5rIGl0IHdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgYW4gZXh0ZW5kZWQg
Zm9ybWF0IGZvciB0aW1lIHRoYXQKcHJpbnRlZCA8c2Vjb25kcz4uPG5hbm9zZWNvbmRzPiwgYW5k
IHdvdWxkIGJlIHZlcnkgaGFwcHkgaWYgeW91IGRlY2lkZWQKeW91IHdhbnRlZCB0byBkbyB0aGF0
LiAgQnV0IEkgZG9uJ3QgdGhpbmsgeW91IHNob3VsZCBiZSByZXF1aXJlZCB0byBkbyBpdC4KCiAt
R2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
