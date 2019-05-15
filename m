From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/altp2m: move
 altp2m_get_effective_entry() under CONFIG_HVM
Date: Wed, 15 May 2019 10:28:37 +0100
Message-ID: <20190515092837.GK2798@zion.uk.xensource.com>
References: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
 <20190515065342.GJ2798@zion.uk.xensource.com>
 <7fcc90c5-35c4-5ce4-e6c0-8e2276fedcd7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQqDQ-0008SU-D6
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:28:48 +0000
Content-Disposition: inline
In-Reply-To: <7fcc90c5-35c4-5ce4-e6c0-8e2276fedcd7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDk6NTU6MzBBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA1LzE1LzE5IDc6NTMgQU0sIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBUdWUsIE1h
eSAxNCwgMjAxOSBhdCAwNzoxMzo1N1BNICswMzAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4g
Pj4gQWxsIGl0cyBjYWxsZXJzIGxpdmUgaW5zaWRlICNpZmRlZiBDT05GSUdfSFZNIHNlY3Rpb25z
Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgoKQXBwbGllZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
