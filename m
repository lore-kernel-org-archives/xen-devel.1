From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/vmx: Don't use
 hvm_inject_hw_exception() in long_mode_do_msr_write()
Date: Thu, 14 Dec 2017 07:38:05 -0700
Message-ID: <5A329ADD0200007800197630@prv-mh.provo.novell.com>
References: <1513162247-1627-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1513162247-1627-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE3IGF0IDExOjUwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gU2luY2UgYy9zIDQ5ZGUxMGYzYzE3MTggIng4Ni9odm06IERvbid0IHJhaXNlICNHUCBi
ZWhpbmQgdGhlIGVtdWxhdG9ycyBiYWNrCj4gZm9yIE1TUiBhY2Nlc3NlcyIsIHJldHVybmluZyBY
ODZFTVVMX0VYQ0VQVElPTiBoYXMgcHVzaGVkIHRoZSBleGNlcHRpb24KPiBnZW5lcmF0aW9uIHRv
IHRoZSB0b3Agb2YgdGhlIGNhbGwgdHJlZS4KPiAKPiBVc2luZyBodm1faW5qZWN0X2h3X2V4Y2Vw
dGlvbigpIGFuZCByZXR1cm5pbmcgWDg2RU1VTF9FWENFUFRJT04gY2F1c2VzIGEKPiBkb3VibGUg
I0dQIGluamVjdGlvbiwgd2hpY2ggY29tYmluZXMgdG8gI0RGLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
