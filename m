From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: introduce a new variable to
 control container user
Date: Mon, 24 Sep 2018 13:41:12 -0500
Message-ID: <20180924184112.cf3sgm64yl6s6oiz@doug-macbook.localdomain>
References: <20180924161829.8676-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n3vt=mg=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1g4VnJ-0003CO-FH
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 18:41:17 +0000
Received: by mail-yw1-xc43.google.com with SMTP id d126-v6so1616024ywa.5
 for <xen-devel@lists.xenproject.org>; Mon, 24 Sep 2018 11:41:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180924161829.8676-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMDU6MTg6MjlQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBTb21ldGltZXMgaXQgaXMgaGFuZHkgdG8gY3JlYXRlIGEgY29udGFpbmVyIGFuZCBwbGF5IGFz
IHJvb3Qgd2l0aCBpdHMKPiBzZXR1cCBtYW51YWxseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+ICBhdXRvbWF0aW9uL3NjcmlwdHMvY29u
dGFpbmVyaXplIHwgOCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250
YWluZXJpemUgYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplCj4gaW5kZXggYmY5YWY1
ODlhOC4uZWEzYzczNzhhYSAxMDA3NTUKPiAtLS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFp
bmVyaXplCj4gKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQo+IEBAIC0yMyw2
ICsyMywxMiBAQCBjYXNlICJfJHtDT05UQUlORVJ9IiBpbgo+ICAgICAgX3N0cmV0Y2h8XykgQ09O
VEFJTkVSPSIke0JBU0V9L2RlYmlhbjpzdHJldGNoIiA7Owo+ICBlc2FjCj4gIAo+ICsjIFVzZSB0
aGlzIHZhcmlhYmxlIHRvIGNvbnRyb2wgd2hlaHRlciByb290IHNob3VsZCBiZSB1c2VkCj4gK2Nh
c2UgIl8ke0NPTlRBSU5FUl9ST09UfSIgaW4KPiArICAgIF8xKSAgIHVzZXJhcmc9IDs7Cj4gKyAg
ICBfMHxfKSB1c2VyYXJnPSItdSAkKGlkIC11KSIgOzsKPiArZXNhYwoKSG93IHdvdWxkIHlvdSBm
ZWVsIGFib3V0IENPTlRBSU5FUl9VSUQwIGluc3RlYWQ/IEkganVzdCBmZWFyIHRoYXQgIlJPT1Qi
CmhhcyBxdWl0ZSBhIGZldyBtZWFuaW5ncy4gZS5nIHRvcCBvZiB0aGUgZmlsZXN5c3RlbT8gVGhl
IHdvcmtpbmcgZGlyCmluc2lkZSBvZiB0aGUgY29udGFpbmVyPwoKTWluZCBkb2N1bWVudGluZyB0
aGlzIGluIGF1dG9tYXRpb24vYnVpbGQvUkVBRE1FLm1kID8gSSBzaG91bGQgbGlrZWx5Cm1vdmUg
cGFydCBvZiB0aGlzIGZpbGUgdGhhdCBkZXNjcmliZXMgdGhlIHZhcmlhYmxlcyB1cCBhIGRpcmVj
dG9yeS4KCi0tCkRvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
