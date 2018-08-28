From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xenforeignmemory: fix fd leakage in error
 path
Date: Tue, 28 Aug 2018 15:32:52 +0100
Message-ID: <c20f94cd-3199-35d0-b21b-5bb20d8144ad@citrix.com>
References: <20180828141955.8611-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qctd=ll=citrix.com=prvs=771e299fc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fuf3K-0005mh-6i
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:33:06 +0000
In-Reply-To: <20180828141955.8611-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDgvMTggMTU6MTksIFdlaSBMaXUgd3JvdGU6Cj4gYjQ5ZWY1ZDMgKHhlbmZvcmVpZ25t
ZW1vcnk6IHdvcmsgYXJvdW5kIGJ1ZyBpbiBvbGRlciBwcml2Y21kKSBhZGRlZCBhbgo+IGVycm9y
IHBhdGggYnV0IGZvcmdvdCB0byBjbG9zZSBmZCB0aGVyZS4KClNwb3R0ZWQgYnkgQ292ZXJpdHku
Cgo+Cj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
