From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Fri, 13 Apr 2018 10:38:56 -0600
Message-ID: <CABfawhniMcLOkfgj3bGBPjg=5qGHCj2p_NSPakGEWWw8di-oyA@mail.gmail.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
 <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dqwc=hc=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1f71jf-0004tH-O9
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 16:39:39 +0000
Received: by mail-wr0-f181.google.com with SMTP id s12so9673154wrc.8
 for <xen-devel@lists.xenproject.org>; Fri, 13 Apr 2018 09:39:38 -0700 (PDT)
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com.
 [209.85.128.174])
 by smtp.gmail.com with ESMTPSA id p27sm3429649eda.83.2018.04.13.09.39.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Apr 2018 09:39:37 -0700 (PDT)
Received: by mail-wr0-f174.google.com with SMTP id s18so9694246wrg.9
 for <xen-devel@lists.xenproject.org>; Fri, 13 Apr 2018 09:39:36 -0700 (PDT)
In-Reply-To: <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMTMsIDIwMTggYXQgODo0NCBBTSwgUmF6dmFuIENvam9jYXJ1CjxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiBPbiAwNC8xMS8yMDE4IDExOjA0IEFNLCBSYXp2
YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IERlYnVnZ2luZyBjb250aW51ZXMuCj4KPiBGaW5hbGx5LCB0
aGUgYXR0YWNoZWQgcGF0Y2ggc2VlbXMgdG8gZ2V0IHRoZSBkaXNwbGF5IHVuc3R1Y2sgaW4gbXkK
PiBzY2VuYXJpbywgYWx0aG91Z2ggZm9yIG9uZSBndWVzdCBJIGdldDoKPgo+IChYRU4pIGQydjAg
VW5leHBlY3RlZCB2bWV4aXQ6IHJlYXNvbiA0OQo+IChYRU4pIGRvbWFpbl9jcmFzaCBjYWxsZWQg
ZnJvbSB2bXguYzo0MTIwCj4gKFhFTikgRG9tYWluIDIgKHZjcHUjMCkgY3Jhc2hlZCBvbiBjcHUj
MToKPiAoWEVOKSAtLS0tWyBYZW4tNC4xMS11bnN0YWJsZSAgeDg2XzY0ICBkZWJ1Zz15ICAgTm90
IHRhaW50ZWQgXS0tLS0KPiAoWEVOKSBDUFU6ICAgIDEKPiAoWEVOKSBSSVA6ICAgIDAwMTA6Wzxm
ZmZmZjk2MDAwODQyMzU0Pl0KPiAoWEVOKSBSRkxBR1M6IDAwMDAwMDAwMDAwMTAyNDYgICBDT05U
RVhUOiBodm0gZ3Vlc3QgKGQydjApCj4gKFhFTikgcmF4OiBmZmZmZjg4MDAzMDAwMDAwICAgcmJ4
OiBmZmZmZjkwMGMwMDgzZGIwICAgcmN4OiAwMDAwMDAwMGFhNTVhYTU1Cj4gKFhFTikgcmR4OiBm
ZmZmZmE4MDA0MWJkYzQxICAgcnNpOiBmZmZmZjkwMGMwMGM2OWEwICAgcmRpOiAwMDAwMDAwMDAw
MDAwMDAxCj4gKFhFTikgcmJwOiAwMDAwMDAwMDAwMDAwMDAwICAgcnNwOiBmZmZmZjg4MDAyZWU5
ZWYwICAgcjg6ICBmZmZmZmE4MDA0MWJkYzQwCj4gKFhFTikgcjk6ICBmZmZmZjgwMDAxODEwZTgw
ICAgcjEwOiBmZmZmZmE4MDAzNDJhYTcwICAgcjExOiBmZmZmZjg4MDAyZWU5ZTgwCj4gKFhFTikg
cjEyOiAwMDAwMDAwMDAwMDAwMDA1ICAgcjEzOiAwMDAwMDAwMDAwMDAwMDAxICAgcjE0OiBmZmZm
ZjkwMGMwMGMwOGIwCj4gKFhFTikgcjE1OiAwMDAwMDAwMDAwMDAwMDAxICAgY3IwOiAwMDAwMDAw
MDgwMDUwMDMxICAgY3I0OiAwMDAwMDAwMDAwMDQwNmY4Cj4gKFhFTikgY3IzOiAwMDAwMDAwMGVm
NzcxMDAwICAgY3IyOiBmZmZmZjkwMGMwMGM4MDAwCj4gKFhFTikgZnNiOiAwMDAwMDAwMGZmZmRl
MDAwICAgZ3NiOiBmZmZmZjgwMDAxODEwZDAwICAgZ3NzOiAwMDAwMDdmZmZmZmRjMDAwCj4gKFhF
TikgZHM6IDAwMmIgICBlczogMDAyYiAgIGZzOiAwMDUzICAgZ3M6IDAwMmIgICBzczogMDAxOCAg
IGNzOiAwMDEwCj4KPiBpLmUuIEVYSVRfUkVBU09OX0VQVF9NSVNDT05GSUcgLSBzbyBub3Qgb2Yg
dGhlIHdvb2RzIHlldC4gSSBhbSBob3BpbmcKPiBzb21lYm9keSBtb3JlIGZhbWlsaWFyIHdpdGgg
dGhlIGNvZGUgY2FuIHBvaW50IHRvIGEgbW9yZSBlbGVnYW50Cj4gc29sdXRpb24gaWYgb25lIGV4
aXN0cy4KCkkgZGFyZSBzYXkgYXQgdGhpcyBwb2ludCB5b3UgbWlnaHQganVzdCBiZSB0aGF0IHBl
cnNvbiA6KSBJIGxvb2tlZCBhdAp0aGUgcGF0Y2gsIG9uZSBpc3N1ZSB3aXRoIHAybV9jaGFuZ2Vf
dHlwZV9yYW5nZSBpbiBpdHMgY3VycmVudCBmb3JtIGlzCnRoYXQgaXQncyB1bmNsZWFyIGhvdyBp
dCB3b3VsZCBiZWhhdmUgd2hlbiB0aGUgcmFuZ2UgY29udGFpbnMgcmVtYXBwZWQKZ2ZucyBpbiBh
biBhbHRwMm0gKGVpdGhlciBhIHBhZ2UgdGhhdCByZW1hcHMgdG8gdGhpcyByYW5nZSwgb3IgYSBw
YWdlCnRoYXQgcmVtYXBzIGZyb20gdGhlIHJhbmdlKS4gQWNjb3JkaW5nIHRvIHRoZSBjdXJyZW50
IGFsdHAybSBhcHByb2FjaApJIHdvdWxkIHNheSB0aGUgYWx0cDJtIHZpZXdzIHNob3VsZCBwcm9i
YWJseSBqdXN0IGdldCBjb21wbGV0ZWx5IHJlc2V0CmlmIHRoZXJlIGlzIHN1Y2ggYSByZW1hcHBp
bmcuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
