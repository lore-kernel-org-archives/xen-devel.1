From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 2/9] libxl: Move dm user determination logic
 into a helper function
Date: Wed, 28 Nov 2018 16:33:10 +0000
Message-ID: <23550.49990.532297.982306@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bc+k=oh=citrix.com=prvs=863aa12bc=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gS2m7-00073q-Hl
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:33:19 +0000
In-Reply-To: <20181123171502.29519-2-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggMi85XSBsaWJ4bDogTW92ZSBkbSB1c2VyIGRl
dGVybWluYXRpb24gbG9naWMgaW50byBhIGhlbHBlciBmdW5jdGlvbiIpOgo+IFRvIHJlbGlhYmx5
IGtpbGwgYW4gdW50cnVzdGVkIGRldmljZW1vZGVsLCB3ZSBuZWVkIHRvIGtub3cgbm90IG9ubHkK
PiBpdHMgcGlkLCBidXQgaXRzIHVpZC4gIEluIHByZXBhcmF0aW9uIGZvciB0aGlzLCBtb3ZlIHRo
ZSB1c2VyaWQKPiBkZXRlcm1pbmF0aW9uIGxvZ2ljIGludG8gYSBoZWxwZXIgZnVuY3Rpb24uCj4g
Cj4gQ3JlYXRlIGEgbmV3IGZpZWxkLCBgZG1fcnVuYXNgLCBpbiBsaWJ4bF9fZG9tYWluX2J1aWxk
X3N0YXRlIHRvIHN0b3JlCj4gdGhlIHZhbHVlIGR1cmluZyBkb21haW4gY3JlYXRpb24uCj4gCj4g
VGhpcyBjaGFuZ2UgYWxzbyByZW1vdmVzIHVubmVjZXNzYXJ5IGR1cGxpY2F0aW9uIG9mIHRoZSBh
cmd1bWVudAo+IGNvbnN0cnVjdGlvbiBjb2RlLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlu
dGVuZGVkLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
