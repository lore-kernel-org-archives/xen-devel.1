From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 5/9] xen/gntdev: Allow mappings for DMA
 buffers
Date: Fri, 15 Jun 2018 17:07:45 -0400
Message-ID: <03e078b0-62a3-5d11-987b-7472f841c44d__27036.6176999689$1529096816$gmane$org@oracle.com>
References: <20180615062753.9229-1-andr2000@gmail.com>
 <20180615062753.9229-6-andr2000@gmail.com>
 <e892748a-c268-9622-e568-4c361366bce1@epam.com>
 <b9c3f740-dea1-638b-49d9-60cf5880619d@suse.com>
 <38f10738-63b6-89ce-07a8-7791b2a7e4dc@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=if9m=jb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fTvx4-0007PW-76
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 21:08:10 +0000
In-Reply-To: <38f10738-63b6-89ce-07a8-7791b2a7e4dc@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTUvMjAxOCAwMjo1MCBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDYvMTUvMjAxOCAwOTo0NiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTUvMDYv
MTggMDg6MzIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4gUGxlYXNlIG5vdGUs
IHRoYXQgdGhpcyB3aWxsIG5lZWQgYSBjaGFuZ2UgKGF0dGFjaGVkKSB3aGlsZQo+Pj4gYXBwbHlp
bmcgdG8gdGhlIG1haW5saW5lIGtlcm5lbCBiZWNhdXNlIG9mIEFQSSBjaGFuZ2VzIFsxXS4KPj4+
Cj4+PiBVbmZvcnR1bmF0ZWx5LCBjdXJyZW50IFhlbiB0aXAga2VybmVsIHRyZWUgaXMgdjQuMTct
cmM1IGJhc2VkLAo+Pj4gc28gSSBjYW5ub3QgbWFrZSB0aGUgY2hhbmdlIGluIHRoaXMgcGF0Y2gg
bm93Lgo+PiBJIGRvbid0IHNlZSBhbnkgY2hhbmNlIHRoaXMgc2VyaWVzIGNvdWxkIGdvIGludG8g
NC4xOCwgYXMgdGhlIG1lcmdlCj4+IHdpbmRvdyBpcyBqdXN0IGNsb3NpbmcuIFNvIHBsZWFzZSBw
b3N0IHRoZSBwYXRjaCBiYXNlZCBvbiBjdXJyZW50Cj4+IExpbnV4IG1hc3RlciBvZiB0b3J2YWxk
cy9saW51eC5naXQKPiBPaywgSSdsbCB3YWl0IGZvciBhbnkgY29tbWVudHMvci1iJ3MgYW5kIHRo
ZW4gcmViYXNlIHRvCj4gdG9ydmFsZHMvbGludXguZ2l0IGFuZCBwdXNoIHY1PwoKQXMgSSBtZW50
aW9uZWQgZWFybGllciwgSSB3b3VsZCB2ZXJ5IG11Y2ggbGlrZSBhdCBsZWFzdCBhIHJldmlldyBv
ZiB0aGUKbmV3IGludGVyZmFjZXMgYnkgc29tZW9uZSBtb3JlIGtub3dsZWRnZWFibGUgdGhhbiBt
ZS4KCgo+IEJUVywgaXMgdGhlcmUgYW55IHBsYW4gdG8gcmViYXNlIFhlbiB0aXAga2VybmVsPwoK
Ckl0IGlzIHR5cGljYWxseSByZWJhc2VkIHRvIHJjNSBvciByNiwgYXQgd2hpY2ggcG9pbnQgcGF0
Y2hlcyBmb3IgdGhlCm5leHQgbWVyZ2Ugd2luZG93IGFyZSBhcHBsaWVkLgoKLWJvcnNpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
