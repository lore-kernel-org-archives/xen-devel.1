From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen: Fix x86 sched_clock() interface for
 xen
Date: Mon, 14 Jan 2019 13:43:00 +0100
Message-ID: <21fbef84-e84c-cdd0-ae1a-856c38a39cf3__38870.3838376843$1547469776$gmane$org@suse.com>
References: <20190111120805.24852-1-jgross@suse.com>
 <f0b7963a-049f-e89e-a9cb-9e0f18f771a3@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=neJr=PW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gj1b2-00022Y-BJ
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 12:44:04 +0000
In-Reply-To: <f0b7963a-049f-e89e-a9cb-9e0f18f771a3@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org, hans@knorrie.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDEvMjAxOSAyMTozNSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEvMTEvMTkg
NzowOCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQEAgLTQyMSw2ICs0MjQsMTEgQEAgdm9p
ZCB4ZW5fcmVzdG9yZV90aW1lX21lbW9yeV9hcmVhKHZvaWQpCj4+ICAJaWYgKHJldCAhPSAwKQo+
PiAgCQlwcl9ub3RpY2UoIkNhbm5vdCByZXN0b3JlIHNlY29uZGFyeSB2Y3B1X3RpbWVfaW5mbyAo
ZXJyICVkKSIsCj4+ICAJCQkgIHJldCk7Cj4+ICsKPj4gK291dDoKPj4gKwkvKiBOZWVkIHB2Y2xv
Y2tfcmVzdW1lKCkgYmVmb3JlIHVzaW5nIHhlbl9jbG9ja3NvdXJjZV9yZWFkKCkuICovCj4+ICsJ
cHZjbG9ja19yZXN1bWUoKTsKPiAKPiBEbyB3ZSB3YW50IHRvIGRyb3AgaXQgZnJvbSB4ZW5fdGlt
ZXJfcmVzdW1lIHRoZW4/CgpZZXMuIFYzIG9uIGl0cyB3YXkuLi4KCgpKdWVyZ2VuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
