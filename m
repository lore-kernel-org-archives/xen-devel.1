From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Remove unnecessary BUG_ON from
 __unbind_from_irq()
Date: Fri, 22 Jun 2018 08:34:28 +0200
Message-ID: <4f71ffde-2c0c-795f-665e-8b90076dd923__7571.13536024026$1529649219$gmane$org@suse.com>
References: <1529602184-2861-1-git-send-email-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cnp7=ji=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fWFeS-00049l-0B
 for xen-devel@lists.xenproject.org; Fri, 22 Jun 2018 06:34:32 +0000
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
Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3It
bGludXMtNC4xOAoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
