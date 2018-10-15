From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/4] xen/arm: initialize access
Date: Mon, 15 Oct 2018 14:08:23 +0100
Message-ID: <c8e6d0fd-6d62-a2d5-7a62-d161afb1e241@arm.com>
References: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
 <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q5c5=m3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gC2br-0004Ll-OM
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 13:08:35 +0000
In-Reply-To: <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, nd@arm.com, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIHRvIENDIHJlbGV2YW50
IG1haW50YWluZXJzLiBJbiAKdGhpcyBjYXNlIHlvdSBuZWVkIHRvIGFkZCBSYXZ6YW4gYW5kIFRh
bWFzLgoKCk9uIDE1LzEwLzIwMTggMTA6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBJ
bml0aWFsaXplIHZhcmlhYmxlICphY2Nlc3MgYmVmb3JlIHJldHVybmluZyBpdCBiYWNrIHRvIHRo
ZSBjYWxsZXIuCgpTYW1lIGFzIHRoZSBwcmV2aW91cyBwYXRjaCwgd2h5IGRvIHlvdSBuZWVkIHRo
aXM/CgpDaGVlcnMsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFub3NAeGlsaW54LmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMgfCAx
ICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYwo+IGlu
ZGV4IGJhNGVjNzguLjEwYWIzMDggMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21lbV9hY2Nl
c3MuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMKPiBAQCAtNDcsNiArNDcsNyBA
QCBzdGF0aWMgaW50IF9fcDJtX2dldF9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIGdmbl90
IGdmbiwKPiAgICAgICB9Owo+ICAgCj4gICAgICAgQVNTRVJUKHAybV9pc19sb2NrZWQocDJtKSk7
Cj4gKyAgICAqYWNjZXNzID0gWEVOTUVNX2FjY2Vzc19uOwo+ICAgCj4gICAgICAgLyogSWYgbm8g
c2V0dGluZyB3YXMgZXZlciBzZXQsIGp1c3QgcmV0dXJuIHJ3eC4gKi8KPiAgICAgICBpZiAoICFw
Mm0tPm1lbV9hY2Nlc3NfZW5hYmxlZCApCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
