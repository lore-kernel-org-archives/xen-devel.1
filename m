From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: don't set pv_post_outb_hook when
 !CONFIG_PV
Date: Thu, 8 Nov 2018 14:58:49 +0000
Message-ID: <8cf749f8-244b-932d-6908-4cd5b2933cf4@citrix.com>
References: <20181108145809.12232-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nrah=nt=citrix.com=prvs=843bae1bd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gKlsV-0003Uc-GO
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:05:51 +0000
In-Reply-To: <20181108145809.12232-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTEvMTggMTQ6NTgsIFdlaSBMaXUgd3JvdGU6Cj4gT2J2aW91c2x5IGl0IHdvbid0IGV4
aXN0IHdoZW4gUFYgaXMgZGlzYWJsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
