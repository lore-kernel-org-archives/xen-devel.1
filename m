From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Mon, 16 Apr 2018 21:46:57 +0300
Message-ID: <de3ffdd5-a3ba-d89a-5ebc-6f17006ae75b@bitdefender.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <3bc816d7-2426-470a-36a3-83e2cd5c81ad@bitdefender.com>
 <3076ce00-8655-81fe-6dc1-b891da638ea2@bitdefender.com>
 <efaa504e-bc4f-243d-f558-cab3dc31b472@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q5ij=hf=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f899f-0004lS-J9
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 18:47:07 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 0A313304C07D
 for <xen-devel@lists.xenproject.org>; Mon, 16 Apr 2018 23:03:09 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (unknown [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 6981A7FC62
 for <xen-devel@lists.xenproject.org>; Mon, 16 Apr 2018 21:47:04 +0300 (EEST)
In-Reply-To: <efaa504e-bc4f-243d-f558-cab3dc31b472@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTYvMjAxOCAwODo0NyBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAwNC8xMy8y
MDE4IDAzOjQ0IFBNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IE9uIDA0LzExLzIwMTggMTE6
MDQgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4+IERlYnVnZ2luZyBjb250aW51ZXMuCj4+
Cj4+IEZpbmFsbHksIHRoZSBhdHRhY2hlZCBwYXRjaCBzZWVtcyB0byBnZXQgdGhlIGRpc3BsYXkg
dW5zdHVjayBpbiBteQo+PiBzY2VuYXJpbywgYWx0aG91Z2ggZm9yIG9uZSBndWVzdCBJIGdldDoK
Pj4KPj4gKFhFTikgZDJ2MCBVbmV4cGVjdGVkIHZtZXhpdDogcmVhc29uIDQ5Cj4+IChYRU4pIGRv
bWFpbl9jcmFzaCBjYWxsZWQgZnJvbSB2bXguYzo0MTIwCj4+IChYRU4pIERvbWFpbiAyICh2Y3B1
IzApIGNyYXNoZWQgb24gY3B1IzE6Cj4+IChYRU4pIC0tLS1bIFhlbi00LjExLXVuc3RhYmxlICB4
ODZfNjQgIGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQo+PiAoWEVOKSBDUFU6ICAgIDEKPj4g
KFhFTikgUklQOiAgICAwMDEwOls8ZmZmZmY5NjAwMDg0MjM1ND5dCj4+IChYRU4pIFJGTEFHUzog
MDAwMDAwMDAwMDAxMDI0NiAgIENPTlRFWFQ6IGh2bSBndWVzdCAoZDJ2MCkKPj4gKFhFTikgcmF4
OiBmZmZmZjg4MDAzMDAwMDAwICAgcmJ4OiBmZmZmZjkwMGMwMDgzZGIwICAgcmN4OiAwMDAwMDAw
MGFhNTVhYTU1Cj4+IChYRU4pIHJkeDogZmZmZmZhODAwNDFiZGM0MSAgIHJzaTogZmZmZmY5MDBj
MDBjNjlhMCAgIHJkaTogMDAwMDAwMDAwMDAwMDAwMQo+PiAoWEVOKSByYnA6IDAwMDAwMDAwMDAw
MDAwMDAgICByc3A6IGZmZmZmODgwMDJlZTllZjAgICByODogIGZmZmZmYTgwMDQxYmRjNDAKPj4g
KFhFTikgcjk6ICBmZmZmZjgwMDAxODEwZTgwICAgcjEwOiBmZmZmZmE4MDAzNDJhYTcwICAgcjEx
OiBmZmZmZjg4MDAyZWU5ZTgwCj4+IChYRU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwNSAgIHIxMzog
MDAwMDAwMDAwMDAwMDAwMSAgIHIxNDogZmZmZmY5MDBjMDBjMDhiMAo+PiAoWEVOKSByMTU6IDAw
MDAwMDAwMDAwMDAwMDEgICBjcjA6IDAwMDAwMDAwODAwNTAwMzEgICBjcjQ6IDAwMDAwMDAwMDAw
NDA2ZjgKPj4gKFhFTikgY3IzOiAwMDAwMDAwMGVmNzcxMDAwICAgY3IyOiBmZmZmZjkwMGMwMGM4
MDAwCj4+IChYRU4pIGZzYjogMDAwMDAwMDBmZmZkZTAwMCAgIGdzYjogZmZmZmY4MDAwMTgxMGQw
MCAgIGdzczogMDAwMDA3ZmZmZmZkYzAwMAo+PiAoWEVOKSBkczogMDAyYiAgIGVzOiAwMDJiICAg
ZnM6IDAwNTMgICBnczogMDAyYiAgIHNzOiAwMDE4ICAgY3M6IDAwMTAKPj4KPj4gaS5lLiBFWElU
X1JFQVNPTl9FUFRfTUlTQ09ORklHIC0gc28gbm90IG9mIHRoZSB3b29kcyB5ZXQuIEkgYW0gaG9w
aW5nCj4+IHNvbWVib2R5IG1vcmUgZmFtaWxpYXIgd2l0aCB0aGUgY29kZSBjYW4gcG9pbnQgdG8g
YSBtb3JlIGVsZWdhbnQKPj4gc29sdXRpb24gaWYgb25lIGV4aXN0cy4KPiAKPiBJIHRoaW5rIEkg
aGF2ZSBhbiBpZGVhIHdoYXQncyBnb2luZyBvbiwgYnV0IGl0J3MgY29tcGxpY2F0ZWQuIDotKQo+
IAo+IEJhc2ljYWxseSwgdGhlIGxvZ2RpcnR5IGZ1bmN0aW9uYWxpdHkgaXNuJ3Qgc2ltcGxlLCBh
bmQgbmVlZHMgY2FyZWZ1bAo+IHRob3VnaHQgb24gaG93IHRvIGludGVncmF0ZSBpdC4gIEknbGwg
d3JpdGUgc29tZSBtb3JlIHRvbW9ycm93LCBhbmQgc2VlCj4gaWYgSSBjYW4gY29tZSB1cCB3aXRo
IGEgc29sdXRpb24uCgpJIHRoaW5rIEkga25vdyB3aHkgdGhpcyBoYXBwZW5zIGZvciB0aGUgb25l
IGd1ZXN0IC0gdGhlIG90aGVyIGd1ZXN0cwpzdGFydCBhdCBhIGNlcnRhaW4gcmVzb2x1dGlvbiBk
aXNwbGF5LXdpc2UgYW5kIHN0YXkgdGhhdCB3YXkgdW50aWwgc2h1dGRvd24uCgpUaGlzIHBhcnRp
Y3VsYXIgZ3Vlc3Qgc3RhcnRzIHdpdGggYSBsYXJnZXIgc2NyZWVuLCB0aGVuIGdvZXMgdG8gcm91
Z2hseQoyLzNyZHMgb2YgaXQsIHRoZW4gdHJpZXMgdG8gZ28gYmFjayB0byB0aGUgaW5pdGlhbCBs
YXJnZXIgb25lIC0gYXQgd2hpY2gKcG9pbnQgdGhlIGFib3ZlIGhhcHBlbnMuIEkgYXNzdW1lIHRo
aXMgY29ycmVzcG9uZHMgdG8gc29tZSBwYWdlcyBiZWluZwpyZW1vdmVkIGFuZC9vciBhZGRlZC4g
SSdsbCB0ZXN0IHRoaXMgdGhlb3J5IG1vcmUgdG9tb3Jyb3cgLSBpZiBpdCdzCmNvcnJlY3QgSSBz
aG91bGQgYmUgYWJsZSB0byByZXByb2R1Y2UgdGhlIGNyYXNoICh3aXRoIHRoZSBwYXRjaCkgYnkK
c2ltcGx5IHJlc2V0dGluZyB0aGUgc2NyZWVuIHJlc29sdXRpb24gKGluY3JlYXNpbmcgaXQpLgoK
ClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
