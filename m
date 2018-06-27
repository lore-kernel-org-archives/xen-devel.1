From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: make sure buffer is null-terminated
 in libxl_read_file_contents
Date: Wed, 27 Jun 2018 11:58:35 +0100
Message-ID: <20180627105835.vxkdh6txjm5hheqa@citrix.com>
References: <1530090791-5210-1-git-send-email-robinlee.sysu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0gw0=jn=citrix.com=prvs=7093bb682=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fY89m-00030b-Vs
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 10:58:39 +0000
Content-Disposition: inline
In-Reply-To: <1530090791-5210-1-git-send-email-robinlee.sysu@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Robin Lee <robinlee.sysu@gmail.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDk6MTM6MTFBTSArMDAwMCwgUm9iaW4gTGVlIHdyb3Rl
Ogo+IE9uIFhlblNlcnZlciA3LjEuMSwgd2Ugc3RhcnQgYSB2bSB3aXRoIFhBUEkgYnV0IGF0dGFj
aCBhIGJsb2NrIGRldmljZSB3aXRoIHhsLgo+IFdlIGNyZWF0ZSBhbiBlbXB0eSBqc29uIGNvbmZp
ZyBmb3IgdGhlIHZtIHdpdGggdGhlIGNvbnRlbnQgInt9XG4iIGFuZCB0aGVuCj4gcnVuICd4bCBi
bG9jay1hdHRhY2gnOgo+IAo+ICAgIyAgeGwgYmxvY2stYXR0YWNoIDEgcGh5Oi9kZXYvbG9vcDAg
eHZkeiB3Cj4gICBsaWJ4bDogZXJyb3I6IGxpYnhsX2pzb24uYzo5NTA6bGlieGxfX2pzb25fcGFy
c2U6IHlhamwgZXJyb3I6IHBhcnNlIGVycm9yOiB0cmFpbGluZyBnYXJiYWdlCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7fSBLXQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgKHJpZ2h0IGhlcmUpIC0tLS0tLV4KPiAKPiAgIGxpYnhsOiBlcnJvcjogbGlieGxfanNvbi5j
OjEwNTM6bGlieGxfX29iamVjdF9mcm9tX2pzb246IHVuYWJsZSB0byBnZW5lcmF0ZSBsaWJ4bF9f
anNvbl9vYmplY3QgZnJvbSBKU09OIHJlcHJlc2VudGF0aW9uIG9mIGxpYnhsX2RvbWFpbl9jb25m
aWcuCj4gICBsaWJ4bDogZXJyb3I6IGxpYnhsLmM6MTk5NTpkZXZpY2VfYWRkcm1fYW9jb21wbGV0
ZTogdW5hYmxlIHRvIGFkZCBkZXZpY2UKPiAgIGxpYnhsX2RldmljZV9kaXNrX2FkZCBmYWlsZWQu
Cj4gCj4gQWZ0ZXIgaW52ZXN0aWdhdGlvbiwgd2UgZm91bmQgdGhlIGJ1ZmZlciByZXR1cm5lZCBm
cm9tIGxpYnhsX3JlYWRfZmlsZV9jb250ZW50cwo+IGlzIG5vdCBudWxsLXRlcm1pbmF0ZWQuIEJ1
dCBsYXRlciBpbiBsaWJ4bF9fb2JqZWN0X2Zyb21fanNvbiwgdGhlIGJ1ZmZlciBpcyBleHBlY3Rl
ZCB0bwo+IGJlIG51bGwtdGVybWluYXRlZC4gU28gcGFyc2luZyBtYXkgZXhjZWVkZWQgdGhlIGVu
ZCBvZiBmaWxlIGFuZCBnZXQgaW4gdG8gdW5pbmlzaWFsaXplZAo+IG1vbWVyeSBhcmVhLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJvYmluIExlZSA8cm9iaW5sZWUuc3lzdUBnbWFpbC5jb20+CgpJIGNh
bid0IHNlZW0gdG8gYmUgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBpbiB1cHN0cmVhbSB4ZW4uIFdo
aWNoIHZlcnNpb24Kb2YgWGVuIGRvZXMgWGVuU2VydmVyIDcuMS4xIGhhdmU/IFlvdSBjYW4gZ2V0
IHRoYXQgZnJvbSB0aGUgb3V0cHV0IG9mCmB4bCBpbmZvYCAtLSBsb29rIGZvciB4ZW5fe21ham9y
LCBtaW5vciwgZXh0cmF9LgoKQlRXIGlmIHlvdSdyZSB1c2luZyBYZW5TZXJ2ZXIgeW91IHByb2Jh
Ymx5IHNob3VsZCB1c2UgWEFQSSB0byBtYW5pcHVsYXRlCmd1ZXN0cyBpbnN0ZWFkLgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
