From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/4] xen/watchdog: Fold exit paths to have a
 single unlock
Date: Mon, 13 May 2019 16:22:45 +0100
Message-ID: <050b49c0-7669-6084-e1a5-4f7f83d106ce@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fllF=TN=citrix.com=prvs=029ba87d2=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hQCmw-00080E-J9
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:22:50 +0000
In-Reply-To: <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Christian Lindig <christian.lindig@citrix.com>, Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xMC8xOSA3OjI4IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoaXMgaXMgbW9zdGx5
IHRvIHNpbXBsaWZ5IGZ1dHVyZSBsb2dpY2FsIGNoYW5nZXMsIGJ1dCBpdCBkb2VzIGNvbWUgd2l0
aCBhCj4gbW9kZXN0IHJlZHVuY3Rpb24gaW4gY29tcGlsZWQgY29kZSBzaXplICgtNTUsIDM0NSA9
PiAyOTApLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
