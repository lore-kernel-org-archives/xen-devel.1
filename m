From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] xen: move pv irq related functions under
 CONFIG_XEN_PV umbrella
Date: Fri, 24 Aug 2018 15:56:59 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808241556300.1550__23098.0427739725$1535118948$gmane$org@nanos.tec.linutronix.de>
References: <20180808061918.5033-1-jgross@suse.com>
 <b7909bb0-ed7c-2640-3f50-136c9e8abf3d@oracle.com>
 <a5dca37c-8d97-33b6-41b1-7d08cab526f7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oirh=lh=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ftCaK-0004i7-K6
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 13:57:08 +0000
In-Reply-To: <a5dca37c-8d97-33b6-41b1-7d08cab526f7@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNCBBdWcgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKCj4gT24gMDgvMDgvMTgg
MTc6MTMsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiA+IHg4NiBtYWludGFpbmVycywgdGhpcyBu
ZWVkcyB5b3UgYWNrIHRvbyBldmVuIHRob3VnaCBpdCBoYXMgInhlbiIgdGFnIGluCj4gPiB0aGUg
c3ViamVjdCwgdGhhbmtzLgo+IAo+IFBpbmc/CgpJIHRob3VnaHQgSSBzZW50IG9uZSBhbHJlYWR5
LCBidXQgaGVyZSB5b3UgZ286CgpBY2tlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0
cm9uaXguZGU+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
