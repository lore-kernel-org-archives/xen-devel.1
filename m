From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 05/16] x86/pv: make guest_io_{read,
 write} local functions
Date: Fri, 19 Oct 2018 16:10:15 +0100
Message-ID: <52a2c51b-e50a-4e3f-a34a-5baab572a335@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <72c49c7223b031564434f3c517c79341118d5d1f.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDWPq-0000DO-3G
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:10:18 +0000
In-Reply-To: <72c49c7223b031564434f3c517c79341118d5d1f.1539959287.git-series.wei.liu2@citrix.com>
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
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCk5pY2UuwqAgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
