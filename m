From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4.9 1/1] jiffies: use jiffies64_to_nsecs()
 to fix 100% steal usage for xen vcpu hotplug
Date: Tue, 12 Mar 2019 05:56:00 -0700
Message-ID: <20190312125600.GF23540__28659.4876948342$1552395417$gmane$org@kroah.com>
References: <1551772744-524-1-git-send-email-dongli.zhang@oracle.com>
 <15c804c0-eeb1-2adb-9cbf-4a28d39983a0@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fGre=RP=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1h3gws-0007Po-2c
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 12:56:02 +0000
Content-Disposition: inline
In-Reply-To: <15c804c0-eeb1-2adb-9cbf-4a28d39983a0@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: jgross@suse.com, herbert.van.den.bergh@oracle.com, sstabellini@kernel.org, sboyd@kernel.org, frederic@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, john.stultz@linaro.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDM6MzU6NDBQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IFRoYW5rcyB0byBKb2UgSmluJ3MgcmVtaW5kaW5nLCB0aGlzIHBhdGNoIGlzIGFwcGxp
Y2FibGUgdG8gbWFpbmxpbmUgbGludXgKPiBrZXJuZWwsIGFsdGhvdWdoIHRoZXJlIGlzIG5vIGlz
c3VlIGR1ZSB0byB0aGlzIGtpbmQgb2YgYnVnIGluIG1haW5saW5lIGtlcm5lbC4KPiAKPiBUaGVy
ZWZvcmUsIGNhbiBJIGZpcnN0IHN1Ym1pdCB0aGlzIHBhdGNoIHRvIG1haW5saW5lIGtlcm5lbCBh
bmQgdGhlbiBiYWNrcG9ydCBpdAo+IHRvIHN0YWJsZSBsaW51eCB3aXRoIG1vcmUgZGV0YWlsZWQg
ZXhwbGFuYXRpb24gaG93IHRoZSBpc3N1ZSBpcyByZXByb2R1Y2VkIG9uIHhlbj8KClllcywgcGxl
YXNlIGRvIHRoYXQuCgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
