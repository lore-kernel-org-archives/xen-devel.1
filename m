From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Tue, 14 May 2019 12:24:17 +0100
Message-ID: <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC8wNS8yMDE5IDExOjA4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAxNC4wNS4xOSAxMjo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSSBndWVz
cyB3ZSBzaG91bGQgYWdyZWUgd2hhdCB0byBpbXBsZW1lbnQgZmlyc3QuCj4+Cj4+IEkgdGhpbmsg
dGhlcmUgYXJlIGFuIGFncmVlbWVudCB0aGF0IHRoZSB0d28gbWV0aG9kcyBzaG91bGQgbm90IGJl
IHVzZWQgdG9nZXRoZXIuCj4gCj4gRm9yIGEgZG9tYWluIG9yIGZvciBhIHBhcnRpY3VsYXIgVkNQ
VT8KPiBIb3cgc2hvdWxkIHdlIHJlc3BvbnNlIG9uIHRoZSByZXF1ZXN0IHRvIHJlZ2lzdGVyIHBh
ZGRyIHdoZW4gd2UgYWxyZWFkeSBoYXZlIAo+IHJlZ2lzdGVyZWQgdmFkZHIgYW5kIHZpY2UgdmVy
c2E/CgogRnJvbSB0aGUgZGlzY3Vzc2lvbiB3aXRoIEphbiwgeW91IHdvdWxkIHRlYXIgZG93biB0
aGUgcHJldmlvdXMgc29sdXRpb24gYW5kIHRoZW4KcmVnaXN0ZXIgdGhlIG5ldyB2ZXJzaW9uLiBT
byB0aGlzIGFsbG93cyBjYXNlcyBsaWtlIGEgYm9vdGxvYWRlciBhbmQgYSBrZXJuZWwgCnVzaW5n
IGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoZSBpbnRlcmZhY2UuCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
