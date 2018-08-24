From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 02/11] x86/paravirt: remove clobbers
 parameter from paravirt patch functions
Date: Fri, 24 Aug 2018 16:01:44 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808241601270.1550__26693.6888722286$1535119230$gmane$org@nanos.tec.linutronix.de>
References: <20180813073739.26108-1-jgross@suse.com>
 <20180813073739.26108-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oirh=lh=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ftCes-0005pT-7N
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 14:01:50 +0000
In-Reply-To: <20180813073739.26108-3-jgross@suse.com>
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

T24gTW9uLCAxMyBBdWcgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKCj4gVGhlIGNsb2JiZXJz
IHBhcmFtZXRlciBmcm9tIHBhcmF2aXJ0X3BhdGNoX2RlZmF1bHQoKSBldCBhbCBpc24ndCB1c2Vk
Cj4gYW55IGxvbmdlci4gUmVtb3ZlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
