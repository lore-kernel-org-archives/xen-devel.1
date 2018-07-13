From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/x86/vpmu: Zero struct pt_regs before
 calling into sample handling code
Date: Fri, 13 Jul 2018 10:41:44 +0200
Message-ID: <8f1cfd9a-cabb-85fe-1b63-5b5162f149be__3035.58201198957$1531471230$gmane$org@suse.com>
References: <1531416420-3580-1-git-send-email-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3fzb=j5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fdte8-0002Mr-SF
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 08:41:48 +0000
In-Reply-To: <1531416420-3580-1-git-send-email-boris.ostrovsky@oracle.com>
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
Cc: mark.rutland@arm.com, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDcvMTggMTk6MjcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPdGhlcndpc2Ugd2Ug
bWF5IGxlYWsga2VybmVsIHN0YWNrIGZvciBldmVudHMgdGhhdCBzYW1wbGUgdXNlcgo+IHJlZ2lz
dGVycy4KPiAKPiBSZXBvcnRlZC1ieTogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCgpSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
