From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 01/11] x86/paravirt: make
 paravirt_patch_call() and paravirt_patch_jmp() static
Date: Fri, 24 Aug 2018 16:00:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808241600250.1550__41181.4332510859$1535119171$gmane$org@nanos.tec.linutronix.de>
References: <20180813073739.26108-1-jgross@suse.com>
 <20180813073739.26108-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oirh=lh=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ftCdq-0005b4-Ga
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 14:00:46 +0000
In-Reply-To: <20180813073739.26108-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: rusty@rustcorp.com.au, peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, akataria@vmware.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxMyBBdWcgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKCj4gcGFyYXZpcnRfcGF0
Y2hfY2FsbCgpIGFuZCBwYXJhdmlydF9wYXRjaF9qbXAoKSBhcmUgdXNlZCBpbiBwYXJhdmlydC5j
Cj4gb25seS4gQ29udmVydCB0aGVtIHRvIHN0YXRpYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogVGhvbWFzIEdsZWl4bmVy
IDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
