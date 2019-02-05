From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Tue, 5 Feb 2019 11:17:06 +0200
Message-ID: <3460048c-f69d-840a-6e8e-cef1e15b76d7@gmail.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
 <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
 <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
 <325628f3-9fc9-d021-fefc-5d06c82dfff5@arm.com>
 <b84c9e8a-e551-2c88-d275-14665835fde8@gmail.com>
 <alpine.DEB.2.10.1902041705520.22962@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eyl=QM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gqwqs-0000mt-SX
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 09:17:10 +0000
Received: by mail-lj1-x242.google.com with SMTP id v1-v6so2276746ljd.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Feb 2019 01:17:09 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1902041705520.22962@sstabellini-ThinkPad-X260>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDA1LjAyLjE5IDAzOjEwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gWW91IHJlYWxs
eSB3YW50IHRvIGZpeCB0aGlzIGluIHRoZSBMaW51eCBkcml2ZXIgaWYgeW91IGNhbiwgYmVjYXVz
ZQo+IHlvdSdsbCBnZXQgYmV0dGVyIHBlcmZvcm1hbmNlIGFuZCBhIG1vcmUgc3RhYmxlIHN5c3Rl
bS4KCkkgYWxzbyBoYXZlIGFuIGlkZWEgdGhhdCBpdCBtaWdodCBpbXByb3ZlIHBlcmZvcm1hbmNl
LiBBbmQgaXQgaXMgd2hhdCB3ZSBuZWVkLgoKPiBJbiB0aGUgc2hvcnQKPiB0ZXJtLCBJIHdvdWxk
IHN1Z2dlc3QgeW91IGtlZXAgdGhlIHdvcmstYXJvdW5kIGluIHlvdXIgcHJpdmF0ZSB0cmVlLgoK
QXMgSSBkbyBub3cuCgo+IEhvd2V2ZXIsIGRvIGxldCB1cyBrbm93IGhvdyB0aGUgZXNjYWxhdGlv
biB3aXRoIHRoZSB2ZW5kb3IgcHJvY2VlZHMgYW5kCj4gaWYgeW91IGhhdmUgYW55IHRyb3VibGVz
IHdpdGggaXQuIEp1bGllbiBhbmQgSSB3b3VsZCBiZSBoYXBweSB0byBwcm92aWRlCj4gaGVscCBp
biB0ZXJtcyBvZiBpbmZvcm1hdGlvbiBhbmQgZG9jcyBvbiB0aGUgcmVhc29ucyB3aHkgdGhpcyBz
aG91bGQgYmUKPiBmaXhlZCBpbiB0aGUgZHJpdmVyLiBKdWxpZW4gbWlnaHQgZXZlbiBiZSBhYmxl
IHRvIGhlbHAgZnVydGhlciB2aWEgaGlzCj4gZW1wbG95ZXIuCgpUaGFuayB5b3UuCkkgYWxyZWFk
eSByZWZlcnJlZCB0aGlzIHRocmVhZCBpbiB0aGUgZW1haWwgdG8gdGhlIHZlbmRvciBhcyB0aGUg
Zmlyc3Qgc3RlcC4KQnV0IGhhdmUgbm8gYW5zd2VyIHlldCA6KAoKLS0gClNpbmNlcmVseSwKQW5k
cmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
