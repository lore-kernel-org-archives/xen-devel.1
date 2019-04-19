From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Subject: Re: Hypervisor build can't work without `python` (Was:
 Re: Xen commit 9b0bc91b3 possibly removed too much info from README)
Date: Fri, 19 Apr 2019 14:07:34 +0800
Message-ID: <CABwOO=fCBUWZMipjJdHFAgqjc95z6Btmk-ZFCWyGOSSmpY_EUQ@mail.gmail.com>
References: <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
 <20190417110356.GT30543@zion.uk.xensource.com>
 <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
 <20190417111635.GU30543@zion.uk.xensource.com>
 <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
 <20190417112645.GV30543@zion.uk.xensource.com>
 <1ff06c9a-8e81-7c00-9dab-26f3d4173714@suse.com>
 <3d698d86-c406-df10-ccb9-17d38988b0a8@citrix.com>
 <606a37f6-2158-14bf-8f49-79ea249b8f62@suse.com>
 <20190417145136.GZ30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yXLQ=SV=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hHMge-0002nt-US
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 06:07:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id s15so5678723wra.12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 23:07:47 -0700 (PDT)
In-Reply-To: <20190417145136.GZ30543@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNyBBcHIgMjAxOSBhdCAyMjo1MSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4KPgo+IEZyYW5rbHkgSSdtIG5vdCBhIGJpZyBmYW4gb2YgdGhpcyBhcHByb2Fj
aCAtLSB5b3UgY2FuIHBvdGVudGlhbGx5IGdldAo+IGRpZmZlcmVudCB0b29sY2hhaW4gZGVwZW5k
aW5nIG9uIGhvdyB5b3UgYnVpbGQgc3R1ZmYuIEkgd291bGQgcmF0aGVyCj4ganVzdCBkb2N1bWVu
dCB0aGF0IGZvciBoeXBlcnZpc29yIGJ1aWxkIGVpdGhlciBweXRob24gaXMgYXZhaWxhYmxlIG9y
Cj4geW91IHNob3VsZCBzcGVjaWZ5IFBZVEhPTj0gd2hlbiBpbnZva2luZyBtYWtlLgo+Cj4gV2Vp
LgoKQXMgSSBzdGFydGVkIGFsbCB0aGlzIG9mZiwgSSB0aG91Z2h0IEknZCBhZGQgaW4gYSBsaXR0
bGUgYml0IG1vcmUsIGFzIEkKdGhpbmsgdGhlcmUgbWF5IGJlIG1vcmUgb3QgdGhpcyB0aGFuIG1l
ZXRzIHRoZSBleWUsIHdlbGwsIGNlcnRhaW5seQpteSBleWUgYW55d2F5LgoKQ2xlYXJseSwgbWFu
eSBvZiB0aGUgc2NyaXB0cyBpbiB0aGUgdG9vbHMgcGFydCB1c2UgcHl0aG9uIHNjcmlwdHMgdGhh
dApoYXZlIGEgL3Vzci9iaW4vZW52IHB5dGhvbiBhcHByb2FjaCB0byBmaW5kaW5nIGEgInB5dGhv
biIKCkkgdGhlcmVmb3JlIHRyaWVkIG1ha2luZyBhIGxpbmsgZnJvbQoKL3Vzci9iaW4vcHl0aG9u
MwoKdG8KCi91c3IvYmluL3B5dGhvbgoKYW5kIHRoZW4gcmFuIHRoZSBjb25maWd1cmUsIFdJVEhP
VVQgZGVmaW5pbmcgYSBQWVRIT04KCi4vY29uZmlndXJlIC0tcHJlZml4PS91c3IgICBcCiAgIC0t
ZGlzYWJsZS1zZWFiaW9zICAgXAogICAtLWRpc2FibGUtcWVtdS10cmFkaXRpb25hbCAgXAogICAt
LWRpc2FibGUtcm9tYmlvcyAgICAgXAogICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4u
L2NvbmZpZy5sb2cKCgpUaGlzIGZhaWxlZCB3aGlsc3QgbG9va2luZyBmb3IgUHl0aG9uLmgKClNv
LCBldmVuIHRob3VnaCBJIGhhdmUgdGhlIGxpbmssIEkgaGF2ZSBzdGlsbCBiZWVuIHJ1bm5pbmcg
dGhlCmNvbmZpZ3VyZSBXSVRIIGEgUFlUSE9OIGJlaW5nIGRlZmluZWQKClBZVEhPTj0vdXNyL2Jp
bi9weXRob24zIC4vY29uZmlndXJlIC0tcHJlZml4PS91c3IgICBcCiAgIC0tZGlzYWJsZS1zZWFi
aW9zICAgXAogICAtLWRpc2FibGUtcWVtdS10cmFkaXRpb25hbCAgXAogICAtLWRpc2FibGUtcm9t
YmlvcyAgICAgXAogICAtLWRpc2FibGUtc3R1YmRvbSAyPiYxIHwgdGVlIC4uL2NvbmZpZy5sb2cK
CmFuZCB0aGF0IGRvZXMgYXBwZWFyIHRvIGNvbmZpZ3VyZSB0aGluZ3MuCgpNeSAibWFrZSB3b3Js
ZCIgaXMgc3RpbGwgZmFpbGluZwoKSSBhbSBhY3R1YWxseSB0aGlua2luZyBvZiBpbnN0YWxsaW5n
IGEgUHl0aG9uIDIgYW5kIG1ha2luZyB0aGUgbGluayB0bwp0aGUgYmFyZSAvdXNyL2Jpbi9weXRo
b24gcG9pbnQgdG8gdGhhdCwganVzdCB0byBzZWUgaWYgSSBjYW4gZ2V0IHRoaW5ncwp0byBidWls
ZC4KCkhvcGUgdGhhdCdzIHVzZWZ1bCwKS2V2aW4KClBTCgpJIGhhdmUgYW5vdGhlciBxdWVzdGlv
biBhYm91dCB0aGUgL3Rvb2xzL01ha2VmaWxlIGJ1dCBJJ2xsIGFzayB0aGF0CmluIGFub3RoZXIg
dGhyZWFkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
