From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/pae: use 64 bit atomic xchg
 function in native_ptep_get_and_clear
Date: Mon, 20 Aug 2018 02:40:12 -0600
Message-ID: <5B7A7E6C02000078001DFD15__2869.62347240678$1534754333$gmane$org@prv1-mh.provo.novell.com>
References: <20180820051456.20779-1-jgross@suse.com>
 <20180820051456.20779-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frfjV-0003vu-9y
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 08:40:17 +0000
In-Reply-To: <20180820051456.20779-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA4LjE4IGF0IDA3OjE0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MTQ4LDE0ICsxNTAsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1ZF9jbGVhcihwdWRfdCAqcHVk
cCkKPiAgI2lmZGVmIENPTkZJR19TTVAKPiAgc3RhdGljIGlubGluZSBwdGVfdCBuYXRpdmVfcHRl
cF9nZXRfYW5kX2NsZWFyKHB0ZV90ICpwdGVwKQo+ICB7Cj4gLQlwdGVfdCByZXM7Cj4gKwl1bmlv
biB7Cj4gKwkJcHRlX3QgcHRlOwo+ICsJCWxvbmcgbG9uZyB2YWw7Cj4gKwl9IHJlczsKCldoeSB0
aGUgdW5pb24/IHB0ZV90IGFscmVhZHkgaXMgb25lLCB3aXRoIHRoZSBwdGUgZmllbGQgYmVpbmcg
d2hhdAp5b3UncmUgYWZ0ZXIgLi4uCgo+IC0JLyogeGNoZyBhY3RzIGFzIGEgYmFycmllciBiZWZv
cmUgdGhlIHNldHRpbmcgb2YgdGhlIGhpZ2ggYml0cyAqLwo+IC0JcmVzLnB0ZV9sb3cgPSB4Y2hn
KCZwdGVwLT5wdGVfbG93LCAwKTsKPiAtCXJlcy5wdGVfaGlnaCA9IHB0ZXAtPnB0ZV9oaWdoOwo+
IC0JcHRlcC0+cHRlX2hpZ2ggPSAwOwo+ICsJcmVzLnZhbCA9IGFyY2hfYXRvbWljNjRfeGNoZygo
YXRvbWljNjRfdCAqKXB0ZXAsIDApOwoKLi4uIGhlcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
