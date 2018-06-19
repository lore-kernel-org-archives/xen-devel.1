From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5] scsi: xen-scsifront: add error handling
 for xenbus_printf
Date: Tue, 19 Jun 2018 14:53:36 +0200
Message-ID: <b47a3387-bc82-4030-a707-b6bb3a2ddf88__19888.1285884001$1529412737$gmane$org@suse.com>
References: <1528774962-39173-1-git-send-email-jiazhouyang09@gmail.com>
 <1529082301-59038-1-git-send-email-jiazhouyang09@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=4s9a=jf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fVG8h-0007La-91
 for xen-devel@lists.xenproject.org; Tue, 19 Jun 2018 12:53:39 +0000
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
ZyBKaWEgPGppYXpob3V5YW5nMDlAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
