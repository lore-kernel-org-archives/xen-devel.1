From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: remove redundant variable save_pud
Date: Tue, 28 Aug 2018 18:27:06 -0400
Message-ID: <3057bad8-cea8-d72f-d83c-88e34c281d22__38532.3065602735$1535495076$gmane$org@oracle.com>
References: <20180828161046.17165-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flle=ll=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fumQw-0007lP-Qg
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 22:25:58 +0000
In-Reply-To: <20180828161046.17165-1-colin.king@canonical.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Colin King <colin.king@canonical.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMjgvMjAxOCAxMjoxMCBQTSwgQ29saW4gS2luZyB3cm90ZToKPiBGcm9tOiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Cj4gVmFyaWFibGUgc2F2ZV9wdWQg
aXMgYmVpbmcgYXNzaWduZWQgYnV0IGlzIG5ldmVyIHVzZWQgaGVuY2UgaXQgaXMKPiByZWR1bmRh
bnQgYW5kIGNhbiBiZSByZW1vdmVkLgo+Cj4gQ2xlYW5zIHVwIGNsYW5nIHdhcm5pbmc6Cj4gdmFy
aWFibGUgJ3NhdmVfcHVkJyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQo+Cj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KCgoKQXBwbGllZCB0byBmb3ItbGludXMtMTliLgoKLWJvcmlzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
