From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] SUPPORT: Correct the description of altp2m
Date: Tue, 23 Oct 2018 15:13:05 +0100
Message-ID: <c819ffa8-6ab6-7856-0be7-2b0150092c90@arm.com>
References: <1540302685-26829-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540302685-26829-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8yMy8xOCAyOjUxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IEFsdHAybSBhaWRz
IG1vbml0b3JpbmcgZ3Vlc3QgbWVtb3J5LCBub3QgaHlwZXJ2aXNvciBtZW1vcnkuICBBbHNvLCBw
dXQgaXRzCj4gY29tbW9uIG5hbWUgaW4gYnJhY2tldHMgdG8gYWlkIHNlYXJjaGluZy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgo+
IC0tLQo+IENDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4g
Q0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgo+IENDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgo+IENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDQzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiBDQzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+
IENDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gLS0tCj4gICBTVVBQ
T1JULm1kIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQubWQgYi9TVVBQT1JULm1kCj4gaW5kZXgg
MzcyNzQ0Ni4uNGYyMDNkYSAxMDA2NDQKPiAtLS0gYS9TVVBQT1JULm1kCj4gKysrIGIvU1VQUE9S
VC5tZAo+IEBAIC0yNDUsNyArMjQ1LDcgQEAgY2FuIGFsbG93IG1vcmUgZWZmaWNpZW50IGFnZ3Jl
Z2F0ZSB1c2Ugb2YgbWVtb3J5IGFjcm9zcyBWTXMuCj4gICAKPiAgICMjIyBBbHRlcm5hdGl2ZSBw
Mm0KPiAgIAo+IC1BbGxvd3MgZXh0ZXJuYWwgbW9uaXRvcmluZyBvZiBoeXBlcnZpc29yIG1lbW9y
eQo+ICtBbHRlcm5hdGl2ZSBwMm0gKGFsdHAybSkgYWxsb3dzIGV4dGVybmFsIG1vbml0b3Jpbmcg
b2YgZ3Vlc3QgbWVtb3J5Cj4gICBieSBtYWludGFpbmluZyBtdWx0aXBsZSBwaHlzaWNhbCB0byBt
YWNoaW5lIChwMm0pIG1lbW9yeSBtYXBwaW5ncy4KPiAgIAo+ICAgICAgIFN0YXR1cywgeDg2IEhW
TTogVGVjaCBQcmV2aWV3Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
