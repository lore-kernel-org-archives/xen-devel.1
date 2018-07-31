From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Tue, 31 Jul 2018 13:05:39 -0400
Message-ID: <a57a15cb-162f-6248-79c9-311756bd9560__23779.0397987284$1533056656$gmane$org@oracle.com>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vyvo=kp=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fkY5P-0008Ay-S8
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 17:05:27 +0000
In-Reply-To: <1532036397-19449-1-git-send-email-longman@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Waiman Long <longman@redhat.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAwNTozOSBQTSwgV2FpbWFuIExvbmcgd3JvdGU6Cj4gT24gYSBWTSB3aXRo
IG9ubHkgMSB2Q1BVLCB0aGUgbG9ja2luZyBmYXN0IHBhdGhzIHdpbGwgYWx3YXlzIGJlCj4gc3Vj
Y2Vzc2Z1bC4gSW4gdGhpcyBjYXNlLCB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSB0aGUgdGhlIFBW
IHFzcGlubG9jawo+IGNvZGUgd2hpY2ggaGFzIGhpZ2hlciBvdmVyaGVhZCBvbiB0aGUgdW5sb2Nr
IHNpZGUgdGhhbiB0aGUgbmF0aXZlCj4gcXNwaW5sb2NrIGNvZGUuCj4KPiBUaGUgeGVuX3B2c3Bp
biB2ZXJpYWJsZSBpcyBhbHNvIHR1cm5lZCBvZmYgaW4gdGhpcyAxIHZDUFUgY2FzZSB0bwo+IGVs
aW1pbmF0ZSB1bm5lZWRlZCBwdnFzcGlubG9jayBpbml0aWFsaXphdGlvbiBpbiB4ZW5faW5pdF9s
b2NrX2NwdSgpCj4gd2hpY2ggaXMgcnVuIGFmdGVyIHhlbl9pbml0X3NwaW5sb2NrcygpLgo+Cj4g
U2lnbmVkLW9mZi1ieTogV2FpbWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4KCgpBcHBsaWVk
IHRvIGZvci1saW51cy00LjE5LgoKLWJvcmlzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
