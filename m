From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Thu, 19 Jul 2018 14:54:56 -0700
Message-ID: <20180719215456.5ho3udhfoqlkh75a__14223.7049098641$1532037244$gmane$org@linux-r8p5>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nihg=kd=stgolabs.net=dave@srs-us1.protection.inumbo.net>)
 id 1fgGtB-00019i-0K
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 21:55:09 +0000
Content-Disposition: inline
In-Reply-To: <1532036397-19449-1-git-send-email-longman@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Waiman Long <longman@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxOSBKdWwgMjAxOCwgV2FpbWFuIExvbmcgd3JvdGU6Cgo+T24gYSBWTSB3aXRoIG9u
bHkgMSB2Q1BVLCB0aGUgbG9ja2luZyBmYXN0IHBhdGhzIHdpbGwgYWx3YXlzIGJlCj5zdWNjZXNz
ZnVsLiBJbiB0aGlzIGNhc2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gdXNlIHRoZSB0aGUgUFYgcXNw
aW5sb2NrCj5jb2RlIHdoaWNoIGhhcyBoaWdoZXIgb3ZlcmhlYWQgb24gdGhlIHVubG9jayBzaWRl
IHRoYW4gdGhlIG5hdGl2ZQo+cXNwaW5sb2NrIGNvZGUuCj4KPlRoZSB4ZW5fcHZzcGluIHZlcmlh
YmxlIGlzIGFsc28gdHVybmVkIG9mZiBpbiB0aGlzIDEgdkNQVSBjYXNlIHRvCj5lbGltaW5hdGUg
dW5uZWVkZWQgcHZxc3BpbmxvY2sgaW5pdGlhbGl6YXRpb24gaW4geGVuX2luaXRfbG9ja19jcHUo
KQo+d2hpY2ggaXMgcnVuIGFmdGVyIHhlbl9pbml0X3NwaW5sb2NrcygpLgoKV291bGRuJ3Qga3Zt
IGFsc28gd2FudCB0aGlzPwoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9rdm0uYyBiL2Fy
Y2gveDg2L2tlcm5lbC9rdm0uYwppbmRleCBhMzdiZGEzOGQyMDUuLjk1YWNlYjY5MjAxMCAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2t2bS5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9rdm0u
YwpAQCAtNDU3LDcgKzQ1Nyw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXZfbWFwX3BlcmNwdV9k
YXRhKHZvaWQpCiBzdGF0aWMgdm9pZCBfX2luaXQga3ZtX3NtcF9wcmVwYXJlX2NwdXModW5zaWdu
ZWQgaW50IG1heF9jcHVzKQogewogCW5hdGl2ZV9zbXBfcHJlcGFyZV9jcHVzKG1heF9jcHVzKTsK
LQlpZiAoa3ZtX3BhcmFfaGFzX2hpbnQoS1ZNX0hJTlRTX1JFQUxUSU1FKSkKKwlpZiAobnVtX3Bv
c3NpYmxlX2NwdXMoKSA9PSAxIHx8CisJICAgIGt2bV9wYXJhX2hhc19oaW50KEtWTV9ISU5UU19S
RUFMVElNRSkpCiAJCXN0YXRpY19icmFuY2hfZGlzYWJsZSgmdmlydF9zcGluX2xvY2tfa2V5KTsK
IH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
