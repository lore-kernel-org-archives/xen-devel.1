From: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC] x86/lapic: remove the PIT usage to
 calibrate the lapic timer
Date: Wed, 19 Sep 2018 18:47:54 +0200
Message-ID: <87o9ctxwlh.fsf@vitty.brq.redhat.com>
References: <20180919162554.80569-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lkvq=mb=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1g2fdw-0007dc-D3
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:48:00 +0000
In-Reply-To: <20180919162554.80569-1-roger.pau@citrix.com> (Roger Pau Monne's
 message of "Wed, 19 Sep 2018 18:25:54 +0200")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JpdGVzOgoKPiBBbmQgaW5z
dGVhZCB1c2UgTk9XIHdoaWNoIGlzIGJhc2VkIG9uIHRoZSBUU0MuIFRoaXMgd2FzIGFscmVhZHkg
dXNlZAo+IHdoZW4gcnVubmluZyBpbiBzaGltIG1vZGUsIHNpbmNlIHRoZXJlJ3MgbGlrZWx5IG5v
IFBJVCBpbiB0aGF0Cj4gZW52aXJvbm1lbnQuCj4KPiBSZW1vdmUgcHJpbnRpbmcgdGhlIENQVSBm
cmVxdWVuY3ksIHNpbmNlIGl0J3MgYWxyZWFkeSBwcmludGVkIGVhcmxpZXIKPiBhdCBib290LCBh
bmQgZ2V0dGluZyB0aGUgQ1BVIGZyZXF1ZW5jeSBhZ2FpbnN0IHRoZSBUU0Mgd2l0aG91dCBhbnkK
PiBleHRlcm5hbCByZWZlcmVuY2UgdGltZXIgaXMgcG9pbnRsZXNzLgo+Cj4gVGhlIG1vdGl2YXRp
b24gYmVoaW5kIHRoaXMgY2hhbmdlIGlzIHRvIGFsbG93IFhlbiB0byBib290IG9uIEh5cGVyVgo+
IGdlbjIgaW5zdGFuY2VzLCB3aGljaCBsYWNrIGEgUElULgoKV2hlbiBvbiBIeXBlci1WLCBMQVBJ
QyBmcmVxdWVuY3kgY2FuIGVhc2lseSBiZSBxdWVyaWVkIGZyb20KSFZfWDY0X01TUl9BUElDX0ZS
RVFVRU5DWSAoYW5kIHRoYXQncyB3aGF0IExpbnV4IGRvZXMgbm93ZGF5cykuIFRoaXMsIG9mCmNv
dXJzZSwgb25seSBpZiBIeXBlci1WIHByb3ZpZGVzIHRoZSBpbnRlcmZhY2UgYnV0IGl0IGFsd2F5
cyBkb2VzLgoKLS0gCiAgVml0YWx5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
