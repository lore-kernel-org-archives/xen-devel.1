From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5] scsi: xen-scsifront: add error handling
 for xenbus_printf
Date: Tue, 19 Jun 2018 15:02:27 +0200
Message-ID: <eb687243-28c7-e6cd-bcf1-c1351e7f4aa4__42914.5969952971$1529413266$gmane$org@suse.com>
References: <1528774962-39173-1-git-send-email-jiazhouyang09@gmail.com>
 <1529082301-59038-1-git-send-email-jiazhouyang09@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=4s9a=jf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fVGHF-0008F3-1M
 for xen-devel@lists.xenproject.org; Tue, 19 Jun 2018 13:02:29 +0000
In-Reply-To: <1529082301-59038-1-git-send-email-jiazhouyang09@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDYvMTggMTk6MDUsIFpob3V5YW5nIEppYSB3cm90ZToKPiBXaGVuIHhlbmJ1c19wcmlu
dGYgZmFpbHMsIHRoZSBsYWNrIG9mIGVycm9yLWhhbmRsaW5nIGNvZGUgbWF5Cj4gY2F1c2UgdW5l
eHBlY3RlZCByZXN1bHRzLgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBlcnJvci1oYW5kbGluZyBjb2Rl
IGFmdGVyIGNhbGxpbmcgeGVuYnVzX3ByaW50Zi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaG91eWFu
ZyBKaWEgPGppYXpob3V5YW5nMDlAZ21haWwuY29tPgoKUHVzaGVkIHRvIHhlbi90aXAuZ2l0IGZv
ci1saW51cy00LjE4CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
