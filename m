From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH v2 02/21] xen/arm: make allocate_memory work
 for non 1:1 mapped guests
Date: Tue, 24 Jul 2018 15:09:03 +0300
Message-ID: <e7970e17-6451-10d1-511a-77041bbb4ff7@epam.com>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-2-git-send-email-sstabellini@kernel.org>
 <94e6cecd-12d7-29bf-51f0-c9e997da6d58@epam.com>
 <alpine.DEB.2.10.1807231130090.19154@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807231130090.19154@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCgpPbiAyMy4wNy4xOCAyMTozMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOgo+IGFsc28gdGhlIEdJQyBhbmQgdGltZXIgYWRkcmVzc2VzIG5lZWQgdG8gYmUgY29uZmln
dXJhYmxlLgpJIGRvbid0IHJlbWVtYmVyIHdlIGV2ZXIgaGFkIGEgcHJvYmxlbSB3aXRoIHRoZW0u
IEJ1dCB5ZXMsIHRoaXMgc2hvdWxkIApiZSBjb25maWd1cmFibGUgYXMgd2VsbC4KCj4gSSB1c3Vh
bGx5IHJlZmVyIHRvIHRoaXMgKGZ1dHVyZSkgZmVhdHVyZSBhcyBhcmJpdHJhcnkgZ3Vlc3QgbWVt
b3J5IG1hcC4KSSBzZWUuCgotLSAKCipBbmRyaWkgQW5pc292KgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
