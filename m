From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Remove unnecessary BUG_ON from
 __unbind_from_irq()
Date: Fri, 22 Jun 2018 07:59:06 +0200
Message-ID: <bbf57e79-e79c-baea-a22a-ffb57990c448__26600.6427155391$1529647082$gmane$org@suse.com>
References: <1529602184-2861-1-git-send-email-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cnp7=ji=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fWF6E-0001Mh-06
 for xen-devel@lists.xenproject.org; Fri, 22 Jun 2018 05:59:10 +0000
In-Reply-To: <1529602184-2861-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: ben.hutchings@codethink.co.uk, stable@vger.kernel.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDYvMTggMTk6MjksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBDb21taXQgOTEwZjhi
ZWZkZjViICgieGVuL3BpcnE6IGZpeCBlcnJvciBwYXRoIGNsZWFudXAgd2hlbiBiaW5kaW5nCj4g
TVNJcyIpIGZpeGVkIGEgY291cGxlIG9mIGVycm9ycyBpbiBlcnJvciBjbGVhbnVwIHBhdGggb2YK
PiB4ZW5fYmluZF9waXJxX21zaV90b19pcnEoKS4gVGhpcyBjbGVhbnVwIGFsbG93ZWQgYSBjYWxs
IHRvCj4gX191bmJpbmRfZnJvbV9pcnEoKSB3aXRoIGFuIHVuYm91bmQgaXJxLCB3aGljaCB3b3Vs
ZCByZXN1bHQgaW4KPiB0cmlnZ2VyaW5nIHRoZSBCVUdfT04gdGhlcmUuCj4gCj4gU2luY2UgdGhl
cmUgaXMgcmVhbGx5IG5vIHJlYXNvbiBmb3IgdGhlIEJVR19PTiAoeGVuX2ZyZWVfaXJxKCkgY2Fu
Cj4gb3BlcmF0ZSBvbiB1bmJvdW5kIGlycXMpIHdlIGNhbiByZW1vdmUgaXQuCj4gCj4gUmVwb3J0
ZWQtYnk6IEJlbiBIdXRjaGluZ3MgPGJlbi5odXRjaGluZ3NAY29kZXRoaW5rLmNvLnVrPgo+IFNp
Z25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
