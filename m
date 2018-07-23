From: <bercarug@amazon.com>
Subject: PVH dom0 creation fails - the system freezes
Date: Mon, 23 Jul 2018 14:50:58 +0300
Message-ID: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------4B21B857BDD1ABAFFAF068FF"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f4m1=kh=amazon.com=prvs=7355b7491=bercarug@srs-us1.protection.inumbo.net>)
 id 1fhZMp-0003ar-LA
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 11:51:07 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, dwmw2@infradead.org, abelgun@amazon.com
List-Id: xen-devel@lists.xenproject.org

--------------4B21B857BDD1ABAFFAF068FF
Content-Type: multipart/alternative;
	boundary="------------A6724333814EC51FEB91FB63"

--------------A6724333814EC51FEB91FB63
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGVsbG8sCgpGb3IgdGhlIGxhc3QgZmV3IGRheXMsIEkgaGF2ZSBiZWVuIHRyeWluZyB0byBnZXQg
YSBQVkggZG9tMCBydW5uaW5nLApob3dldmVyIEkgZW5jb3VudGVyZWQgdGhlIGZvbGxvd2luZyBw
cm9ibGVtOiB0aGUgc3lzdGVtIHNlZW1zIHRvCmZyZWV6ZSBhZnRlciB0aGUgaHlwZXJ2aXNvciBi
b290cywgdGhlIHNjcmVlbiBnb2VzIGJsYWNrLiBJIGhhdmUgdHJpZWQgdG8KZGVidWcgaXQgdmlh
IGEgc2VyaWFsIGNvbnNvbGUgKHVzaW5nIE1pbmljb20pIGFuZCBtYW5hZ2VkIHRvIGdldCBzb21l
Cm1vcmUgWGVuIG91dHB1dCwgYWZ0ZXIgdGhlIHNjcmVlbiB0dXJucyBibGFjay4KCkkgbWVudGlv
biB0aGF0IEkgaGF2ZSB0cmllZCB0byBib290IHRoZSBQVkggZG9tMCB1c2luZyBkaWZmZXJlbnQg
a2VybmVsCmltYWdlcyAoZnJvbSA0LjkuMCB0byA0LjE4LXJjMyksIGRpZmZlcmVudCBYZW7CoCB2
ZXJzaW9ucyAoNC4xMCwgNC4xMSwgNC4xMikuCgpCZWxvdyBJIGF0dGFjaGVkIG15IHN5c3RlbSAv
IGh5cGVydmlzb3IgY29uZmlndXJhdGlvbiwgYXMgd2VsbCBhcyB0aGUKb3V0cHV0IGNhcHR1cmVk
IHRocm91Z2ggdGhlIHNlcmlhbCBjb25zb2xlLCBjb3JyZXNwb25kaW5nIHRvIHRoZSBsYXRlc3QK
dmVyc2lvbnMgZm9yIFhlbiBhbmQgdGhlIExpbnV4IEtlcm5lbCAoWGVuIHN0YWdpbmcgYW5kIEtl
cm5lbCBmcm9tIHRoZQp4ZW4vdGlwIHRyZWUpLgoKCk9TICsgRGlzdHJvOiBMaW51eCAvIERlYmlh
biA5IFN0cmV0Y2gKS2VybmVsIFZlcnNpb246IDQuMTctcmM1LCB0YWdnZWQgd2l0aCBmb3ItbGlu
dXMtNC4xOC1yYzUtdGFnIGZyb20gdGhlCnhlbi90aXAgdHJlZS4KWGVuIFZlcnNpb246IDQuMTIs
IGNvbW1pdCBpZCBlM2Y2NjdiYzVmNTFkMGFhNDQzNTdhNjRjYTEzNGNkOTUyNjc5YzgxCm9mIHRo
ZSBYZW4gdHJlZS4KSG9zdCBzeXN0ZW06IGF0dGFjaGVkIGNwdWluZm8ubG9nClNlcmlhbCBjb25z
b2xlIG91dHB1dDogYXR0YWNoZWQgYm9vdC5sb2cKTXkgZ3J1YiBjb25maWd1cmF0aW9uIGZpbGUs
IGNvbnRhaW5pbmcgdGhlIFhlbiBjb21tYW5kIGxpbmUgYXJndW1lbnRzOiAKYXR0YWNoZWQKZ3J1
Yi5sb2cKCkkgY2FuIHByb3ZpZGUgYWRkaXRpb25hbCBpbmZvIGFzIHJlcXVlc3RlZC4KQW55IGlk
ZWFzIHdoeSB0aGlzIGhhcHBlbnM/IERvIHlvdSBoYXZlIGFueSByZWNvbW1lbmRhdGlvbnMgZm9y
IGFkZGl0aW9uYWwKZGVidWdnaW5nPwoKSGVyZSBhcmUgdGhlIGxhc3QgZmV3IGxpbmVzIG9mIHRo
ZSBib290IGxvZy4gVGhlIGxhc3QgKHNlcGFyYXRlZCkgb25lcyAKd2VyZSBvbmx5CnZpc2libGUg
dGhvdWdoIHRoZSBzZXJpYWwgY29uc29sZSwgc2luY2UgYXQgdGhhdCBwb2ludCB0aGUgc2NyZWVu
IHdhcyAKY29tcGxldGVseQpibGFjay4KCihYRU4pICoqKiBCdWlsZGluZyBhIFBWSCBEb20wICoq
KgooWEVOKSBbVlQtRF1kMDpIb3N0YnJpZGdlOiBza2lwIDAwMDA6MDA6MDAuMCBtYXAKKFhFTikg
W1ZULURdZDA6UENJOiBtYXAgMDAwMDowMDoxNC4wCihYRU4pIFtWVC1EXWQwOlBDSTogbWFwIDAw
MDA6MDA6MTQuMgooWEVOKSBbVlQtRF1kMDpQQ0k6IG1hcCAwMDAwOjAwOjE2LjAKKFhFTikgW1ZU
LURdZDA6UENJOiBtYXAgMDAwMDowMDoxNi4xCihYRU4pIFtWVC1EXWQwOlBDSTogbWFwIDAwMDA6
MDA6MTcuMAooWEVOKSBbVlQtRF1kMDpQQ0k6IG1hcCAwMDAwOjAwOjFmLjAKKFhFTikgW1ZULURd
ZDA6UENJOiBtYXAgMDAwMDowMDoxZi4yCihYRU4pIFtWVC1EXWQwOlBDSTogbWFwIDAwMDA6MDA6
MWYuNAooWEVOKSBbVlQtRF1kMDpQQ0llOiBtYXAgMDAwMDowMTowMC4wCihYRU4pIFtWVC1EXWQw
OlBDSWU6IG1hcCAwMDAwOjAyOjAwLjAKKFhFTikgW1ZULURdZDA6UENJZTogbWFwIDAwMDA6MDM6
MDAuMAooWEVOKSBbVlQtRF1kMDpQQ0llOiBtYXAgMDAwMDowNDowMC4wCihYRU4pIFtWVC1EXWlv
bW11X2VuYWJsZV90cmFuc2xhdGlvbjogaW9tbXUtPnJlZyA9IGZmZmY4MmMwMDAyMWIwMDAKKFhF
TikgV0FSTklORzogUFZIIGlzIGFuIGV4cGVyaW1lbnRhbCBtb2RlIHdpdGggbGltaXRlZCBmdW5j
dGlvbmFsaXR5CihYRU4pIEluaXRpYWwgbG93IG1lbW9yeSB2aXJxIHRocmVzaG9sZCBzZXQgYXQg
MHg0MDAwIHBhZ2VzLgooWEVOKSBTY3J1YmJpbmcgRnJlZSBSQU0gb24gMSBub2RlcyB1c2luZyA0
IENQVXMKKFhFTikgCi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uZG9uZS4KKFhFTikgU3RkLiBMb2dsZXZlbDog
QWxsCihYRU4pIEd1ZXN0IExvZ2xldmVsOiBBbGwKKFhFTikgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIFdBUk5JTkc6IENPTlNPTEUgT1VU
UFVUIElTIFNZTkNIUk9OT1VTCihYRU4pIFRoaXMgb3B0aW9uIGlzIGludGVuZGVkIHRvIGFpZCBk
ZWJ1Z2dpbmcgb2YgWGVuIGJ5IGVuc3VyaW5nCihYRU4pIHRoYXQgYWxsIG91dHB1dCBpcyBzeW5j
aHJvbm91c2x5IGRlbGl2ZXJlZCBvbiB0aGUgc2VyaWFsIGxpbmUuCihYRU4pIEhvd2V2ZXIgaXQg
Y2FuIGludHJvZHVjZSBTSUdOSUZJQ0FOVCBsYXRlbmNpZXMgYW5kIGFmZmVjdAooWEVOKSB0aW1l
a2VlcGluZy4gSXQgaXMgTk9UIHJlY29tbWVuZGVkIGZvciBwcm9kdWN0aW9uIHVzZSEKKFhFTikg
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4p
IDMuLi4gMi4uLiAxLi4uCgooWEVOKSBYZW4gaXMgcmVsaW5xdWlzaGluZyBWR0EgY29uc29sZS4K
KFhFTikgKioqIFNlcmlhbCBpbnB1dCAtPiBET00wICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVz
IHRvIHN3aXRjaCAKaW5wdXQgdG8gWGVuKQooWEVOKSBGcmVlZCA0NjhrQiBpbml0IG1lbW9yeQoo
WEVOKSBbVlQtRF1pb21tdS5jOjkxOTogaW9tbXVfZmF1bHRfc3RhdHVzOiBGYXVsdCBPdmVyZmxv
dwooWEVOKSBbVlQtRF1pb21tdS5jOjkyMTogaW9tbXVfZmF1bHRfc3RhdHVzOiBQcmltYXJ5IFBl
bmRpbmcgRmF1bHQKKFhFTikgW1ZULURdRE1BUjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmljZSBb
MDAwMDowMDoxNC4wXSBmYXVsdCBhZGRyIAo4ZGViMzAwMCwgaW9tbXUgcmVnID0gZmZmZjgyYzAw
MDIxYjAwMAooWEVOKSBbVlQtRF1ETUFSOiByZWFzb24gMDUgLSBQVEUgV3JpdGUgYWNjZXNzIGlz
IG5vdCBzZXQKKFhFTikgcHJpbnRfdnRkX2VudHJpZXM6IGlvbW11ICMwIGRldiAwMDAwOjAwOjE0
LjAgZ21mbiA4ZGViMwooWEVOKSByb290X2VudHJ5WzAwXSA9IDEwMjFjNjAwMDEKKFhFTikgY29u
dGV4dFthMF0gPSAyXzEwMjFkNmQwMDEKKFhFTikgbDRbMDAwXSA9IDljMDAwMDEwMjFkNmMxMDcK
KFhFTikgbDNbMDAyXSA9IDljMDAwMDEwMjFkM2UxMDcKKFhFTikgbDJbMDZmXSA9IDljMDAwMDEw
MjE4YzAxMDcKKFhFTikgbDFbMGIzXSA9IDgwMDAwMDAwMDAwMDAwMDAKKFhFTikgbDFbMGIzXSBu
b3QgcHJlc2VudAooWEVOKSBEb20wIGNhbGxiYWNrIHZpYSBjaGFuZ2VkIHRvIERpcmVjdCBWZWN0
b3IgMHhmMwoKVGhhbmtzLApHYWJyaWVsCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIChS
b21hbmlhKSBTLlIuTC4gcmVnaXN0ZXJlZCBvZmZpY2U6IDI3QSBTZi4gTGF6YXIgU3RyZWV0LCBV
QkM1LCBmbG9vciAyLCBJYXNpLCBJYXNpIENvdW50eSwgNzAwMDQ1LCBSb21hbmlhLiBSZWdpc3Rl
cmVkIGluIFJvbWFuaWEuIFJlZ2lzdHJhdGlvbiBudW1iZXIgSjIyLzI2MjEvMjAwNS4K

--------------A6724333814EC51FEB91FB63
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CgogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250
ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPgogIDwvaGVhZD4KICA8Ym9keSB0ZXh0PSIj
MDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIDxwPjxmb250IHNpemU9IjIiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTBwdDsiPkhlbGxvLDxicj4KICAgICAgICAgIDxicj4KICAgICAgICAg
IEZvciB0aGUgbGFzdCBmZXcgZGF5cywgSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIGdldCBhIFBWSCBk
b20wCiAgICAgICAgICBydW5uaW5nLDxicj4KICAgICAgICAgIGhvd2V2ZXIgSSBlbmNvdW50ZXJl
ZCB0aGUgZm9sbG93aW5nIHByb2JsZW06IHRoZSBzeXN0ZW0gc2VlbXMKICAgICAgICAgIHRvPGJy
PgogICAgICAgICAgZnJlZXplIGFmdGVyIHRoZSBoeXBlcnZpc29yIGJvb3RzLCB0aGUgc2NyZWVu
IGdvZXMgYmxhY2suIEkKICAgICAgICAgIGhhdmUgdHJpZWQgdG88YnI+CiAgICAgICAgICBkZWJ1
ZyBpdCB2aWEgYSBzZXJpYWwgY29uc29sZSAodXNpbmcgTWluaWNvbSkgYW5kIG1hbmFnZWQgdG8K
ICAgICAgICAgIGdldCBzb21lPGJyPgogICAgICAgICAgbW9yZSBYZW4gb3V0cHV0LCBhZnRlciB0
aGUgc2NyZWVuIHR1cm5zIGJsYWNrLjxicj4KICAgICAgICAgIMKgPGJyPgogICAgICAgICAgSSBt
ZW50aW9uIHRoYXQgSSBoYXZlIHRyaWVkIHRvIGJvb3QgdGhlIFBWSCBkb20wIHVzaW5nCiAgICAg
ICAgICBkaWZmZXJlbnQga2VybmVsPGJyPgogICAgICAgICAgaW1hZ2VzIChmcm9tIDQuOS4wIHRv
IDQuMTgtcmMzKSwgZGlmZmVyZW50IFhlbsKgIHZlcnNpb25zCiAgICAgICAgICAoNC4xMCwgNC4x
MSwgNC4xMikuPGJyPgogICAgICAgICAgPGJyPgogICAgICAgICAgQmVsb3cgSSBhdHRhY2hlZCBt
eSBzeXN0ZW0gLyBoeXBlcnZpc29yIGNvbmZpZ3VyYXRpb24sIGFzIHdlbGwKICAgICAgICAgIGFz
IHRoZTxicj4KICAgICAgICAgIG91dHB1dCBjYXB0dXJlZCB0aHJvdWdoIHRoZSBzZXJpYWwgY29u
c29sZSwgY29ycmVzcG9uZGluZyB0bwogICAgICAgICAgdGhlIGxhdGVzdDxicj4KICAgICAgICAg
IHZlcnNpb25zIGZvciBYZW4gYW5kIHRoZSBMaW51eCBLZXJuZWwgKFhlbiBzdGFnaW5nIGFuZCBL
ZXJuZWwKICAgICAgICAgIGZyb20gdGhlPGJyPgogICAgICAgICAgeGVuL3RpcCB0cmVlKS48YnI+
CiAgICAgICAgICA8YnI+CiAgICAgICAgICA8YnI+CiAgICAgICAgICBPUyArIERpc3RybzogTGlu
dXggLyBEZWJpYW4gOSBTdHJldGNoPGJyPgogICAgICAgICAgS2VybmVsIFZlcnNpb246IDQuMTct
cmM1LCB0YWdnZWQgd2l0aCBmb3ItbGludXMtNC4xOC1yYzUtdGFnCiAgICAgICAgICBmcm9tIHRo
ZTxicj4KICAgICAgICAgIHhlbi90aXAgdHJlZS48YnI+CiAgICAgICAgICBYZW4gVmVyc2lvbjog
NC4xMiwgY29tbWl0IGlkCiAgICAgICAgICBlM2Y2NjdiYzVmNTFkMGFhNDQzNTdhNjRjYTEzNGNk
OTUyNjc5YzgxPGJyPgogICAgICAgICAgb2YgdGhlIFhlbiB0cmVlLjxicj4KICAgICAgICAgIEhv
c3Qgc3lzdGVtOiBhdHRhY2hlZCBjcHVpbmZvLmxvZzxicj4KICAgICAgICAgIFNlcmlhbCBjb25z
b2xlIG91dHB1dDogYXR0YWNoZWQgYm9vdC5sb2c8YnI+CiAgICAgICAgICBNeSBncnViIGNvbmZp
Z3VyYXRpb24gZmlsZSwgY29udGFpbmluZyB0aGUgWGVuIGNvbW1hbmQgbGluZQogICAgICAgICAg
YXJndW1lbnRzOiBhdHRhY2hlZDxicj4KICAgICAgICAgIGdydWIubG9nPGJyPgogICAgICAgICAg
PGJyPgogICAgICAgICAgSSBjYW4gcHJvdmlkZSBhZGRpdGlvbmFsIGluZm8gYXMgcmVxdWVzdGVk
Ljxicj4KICAgICAgICAgIEFueSBpZGVhcyB3aHkgdGhpcyBoYXBwZW5zPyBEbyB5b3UgaGF2ZSBh
bnkgcmVjb21tZW5kYXRpb25zCiAgICAgICAgICBmb3IgYWRkaXRpb25hbDxicj4KICAgICAgICAg
IGRlYnVnZ2luZz88YnI+CiAgICAgICAgICA8YnI+CiAgICAgICAgICBIZXJlIGFyZSB0aGUgbGFz
dCBmZXcgbGluZXMgb2YgdGhlIGJvb3QgbG9nLiBUaGUgbGFzdAogICAgICAgICAgKHNlcGFyYXRl
ZCkgb25lcyB3ZXJlIG9ubHk8YnI+CiAgICAgICAgICB2aXNpYmxlIHRob3VnaCB0aGUgc2VyaWFs
IGNvbnNvbGUsIHNpbmNlIGF0IHRoYXQgcG9pbnQgdGhlCiAgICAgICAgICBzY3JlZW4gd2FzIGNv
bXBsZXRlbHk8YnI+CiAgICAgICAgICBibGFjay48YnI+CiAgICAgICAgICDCoDxicj4KICAgICAg
ICAgIChYRU4pICoqKiBCdWlsZGluZyBhIFBWSCBEb20wICoqKjxicj4KICAgICAgICAgIChYRU4p
IFtWVC1EXWQwOkhvc3RicmlkZ2U6IHNraXAgMDAwMDowMDowMC4wIG1hcDxicj4KICAgICAgICAg
IChYRU4pIFtWVC1EXWQwOlBDSTogbWFwIDAwMDA6MDA6MTQuMDxicj4KICAgICAgICAgIChYRU4p
IFtWVC1EXWQwOlBDSTogbWFwIDAwMDA6MDA6MTQuMjxicj4KICAgICAgICAgIChYRU4pIFtWVC1E
XWQwOlBDSTogbWFwIDAwMDA6MDA6MTYuMDxicj4KICAgICAgICAgIChYRU4pIFtWVC1EXWQwOlBD
STogbWFwIDAwMDA6MDA6MTYuMTxicj4KICAgICAgICAgIChYRU4pIFtWVC1EXWQwOlBDSTogbWFw
IDAwMDA6MDA6MTcuMDxicj4KICAgICAgICAgIChYRU4pIFtWVC1EXWQwOlBDSTogbWFwIDAwMDA6
MDA6MWYuMDxicj4KICAgICAgICAgIChYRU4pIFtWVC1EXWQwOlBDSTogbWFwIDAwMDA6MDA6MWYu
Mjxicj4KICAgICAgICAgIChYRU4pIFtWVC1EXWQwOlBDSTogbWFwIDAwMDA6MDA6MWYuNDxicj4K
ICAgICAgICAgIChYRU4pIFtWVC1EXWQwOlBDSWU6IG1hcCAwMDAwOjAxOjAwLjA8YnI+CiAgICAg
ICAgICAoWEVOKSBbVlQtRF1kMDpQQ0llOiBtYXAgMDAwMDowMjowMC4wPGJyPgogICAgICAgICAg
KFhFTikgW1ZULURdZDA6UENJZTogbWFwIDAwMDA6MDM6MDAuMDxicj4KICAgICAgICAgIChYRU4p
IFtWVC1EXWQwOlBDSWU6IG1hcCAwMDAwOjA0OjAwLjA8YnI+CiAgICAgICAgICAoWEVOKSBbVlQt
RF1pb21tdV9lbmFibGVfdHJhbnNsYXRpb246IGlvbW11LSZndDtyZWcgPQogICAgICAgICAgZmZm
ZjgyYzAwMDIxYjAwMDxicj4KICAgICAgICAgIChYRU4pIFdBUk5JTkc6IFBWSCBpcyBhbiBleHBl
cmltZW50YWwgbW9kZSB3aXRoIGxpbWl0ZWQKICAgICAgICAgIGZ1bmN0aW9uYWxpdHk8YnI+CiAg
ICAgICAgICAoWEVOKSBJbml0aWFsIGxvdyBtZW1vcnkgdmlycSB0aHJlc2hvbGQgc2V0IGF0IDB4
NDAwMCBwYWdlcy48YnI+CiAgICAgICAgICAoWEVOKSBTY3J1YmJpbmcgRnJlZSBSQU0gb24gMSBu
b2RlcyB1c2luZyA0IENQVXM8YnI+CiAgICAgICAgICAoWEVOKQouLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLmRv
bmUuPGJyPgogICAgICAgICAgKFhFTikgU3RkLiBMb2dsZXZlbDogQWxsPGJyPgogICAgICAgICAg
KFhFTikgR3Vlc3QgTG9nbGV2ZWw6IEFsbDxicj4KICAgICAgICAgIChYRU4pICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjxicj4KICAgICAgICAgIChY
RU4pIFdBUk5JTkc6IENPTlNPTEUgT1VUUFVUIElTIFNZTkNIUk9OT1VTPGJyPgogICAgICAgICAg
KFhFTikgVGhpcyBvcHRpb24gaXMgaW50ZW5kZWQgdG8gYWlkIGRlYnVnZ2luZyBvZiBYZW4gYnkK
ICAgICAgICAgIGVuc3VyaW5nPGJyPgogICAgICAgICAgKFhFTikgdGhhdCBhbGwgb3V0cHV0IGlz
IHN5bmNocm9ub3VzbHkgZGVsaXZlcmVkIG9uIHRoZSBzZXJpYWwKICAgICAgICAgIGxpbmUuPGJy
PgogICAgICAgICAgKFhFTikgSG93ZXZlciBpdCBjYW4gaW50cm9kdWNlIFNJR05JRklDQU5UIGxh
dGVuY2llcyBhbmQKICAgICAgICAgIGFmZmVjdDxicj4KICAgICAgICAgIChYRU4pIHRpbWVrZWVw
aW5nLiBJdCBpcyBOT1QgcmVjb21tZW5kZWQgZm9yIHByb2R1Y3Rpb24gdXNlITxicj4KICAgICAg
ICAgIChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKjxicj4KICAgICAgICAgIChYRU4pIDMuLi4gMi4uLiAxLi4uPGJyPgogICAgICAgICAgPGJy
PgogICAgICAgICAgKFhFTikgWGVuIGlzIHJlbGlucXVpc2hpbmcgVkdBIGNvbnNvbGUuPGJyPgog
ICAgICAgICAgKFhFTikgKioqIFNlcmlhbCBpbnB1dCAtJmd0OyBET00wICh0eXBlICdDVFJMLWEn
IHRocmVlIHRpbWVzCiAgICAgICAgICB0byBzd2l0Y2ggaW5wdXQgdG8gWGVuKTxicj4KICAgICAg
ICAgIChYRU4pIEZyZWVkIDQ2OGtCIGluaXQgbWVtb3J5PGJyPgogICAgICAgICAgKFhFTikgW1ZU
LURdaW9tbXUuYzo5MTk6IGlvbW11X2ZhdWx0X3N0YXR1czogRmF1bHQgT3ZlcmZsb3c8YnI+CiAg
ICAgICAgICAoWEVOKSBbVlQtRF1pb21tdS5jOjkyMTogaW9tbXVfZmF1bHRfc3RhdHVzOiBQcmlt
YXJ5IFBlbmRpbmcKICAgICAgICAgIEZhdWx0PGJyPgogICAgICAgICAgKFhFTikgW1ZULURdRE1B
UjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmljZSBbMDAwMDowMDoxNC4wXQogICAgICAgICAgZmF1
bHQgYWRkciA4ZGViMzAwMCwgaW9tbXUgcmVnID0gZmZmZjgyYzAwMDIxYjAwMDxicj4KICAgICAg
ICAgIChYRU4pIFtWVC1EXURNQVI6IHJlYXNvbiAwNSAtIFBURSBXcml0ZSBhY2Nlc3MgaXMgbm90
IHNldDxicj4KICAgICAgICAgIChYRU4pIHByaW50X3Z0ZF9lbnRyaWVzOiBpb21tdSAjMCBkZXYg
MDAwMDowMDoxNC4wIGdtZm4gOGRlYjM8YnI+CiAgICAgICAgICAoWEVOKSByb290X2VudHJ5WzAw
XSA9IDEwMjFjNjAwMDE8YnI+CiAgICAgICAgICAoWEVOKSBjb250ZXh0W2EwXSA9IDJfMTAyMWQ2
ZDAwMTxicj4KICAgICAgICAgIChYRU4pIGw0WzAwMF0gPSA5YzAwMDAxMDIxZDZjMTA3PGJyPgog
ICAgICAgICAgKFhFTikgbDNbMDAyXSA9IDljMDAwMDEwMjFkM2UxMDc8YnI+CiAgICAgICAgICAo
WEVOKSBsMlswNmZdID0gOWMwMDAwMTAyMThjMDEwNzxicj4KICAgICAgICAgIChYRU4pIGwxWzBi
M10gPSA4MDAwMDAwMDAwMDAwMDAwPGJyPgogICAgICAgICAgKFhFTikgbDFbMGIzXSBub3QgcHJl
c2VudDxicj4KICAgICAgICAgIChYRU4pIERvbTAgY2FsbGJhY2sgdmlhIGNoYW5nZWQgdG8gRGly
ZWN0IFZlY3RvciAweGYzPGJyPgogICAgICAgICAgPGJyPgogICAgICAgICAgVGhhbmtzLDxicj4K
ICAgICAgICAgIEdhYnJpZWw8L3NwYW4+PC9mb250PjwvcD4KICA8cD48L3A+Cgo8cD48YnI+CkFt
YXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgKFJvbWFuaWEpIFMuUi5MLiByZWdpc3RlcmVkIG9mZmlj
ZTogMjdBIFNmLiBMYXphciBTdHJlZXQsIFVCQzUsIGZsb29yIDIsIElhc2ksIElhc2kgQ291bnR5
LCA3MDAwNDUsIFJvbWFuaWEuIFJlZ2lzdGVyZWQgaW4gUm9tYW5pYS4gUmVnaXN0cmF0aW9uIG51
bWJlciBKMjIvMjYyMS8yMDA1LjwvcD4KPC9ib2R5Pgo8L2h0bWw+Cg==

--------------A6724333814EC51FEB91FB63--

--------------4B21B857BDD1ABAFFAF068FF
Content-Type: text/x-log; name="boot.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="boot.log"

(XEN) Xen version 4.12-unstable (root@) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516) debug=y  Mon Jul 16 09:20:26 EDT 2018
(XEN) Latest ChangeSet: Thu Jul 12 18:48:06 2018 +0200 git:e3f667bc5f
(XEN) Console output is synchronous.
(XEN) Bootloader: GRUB 2.02~beta3-5
(XEN) Command line: placeholder dom0=pvh dom0_mem=4096M loglvl=all sync_console console_to_ring=true console=com1,vga com1=115200,8n1 iommu=debug,verbose,workaround_bios_bug iommu_inclusive_mapping=true
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) Disc information:
(XEN)  Found 1 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 0000000000098c00 (usable)
(XEN)  0000000000098c00 - 00000000000a0000 (reserved)
(XEN)  00000000000e0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 000000008c1c4000 (usable)
(XEN)  000000008c1c4000 - 000000008c1c5000 (ACPI NVS)
(XEN)  000000008c1c5000 - 000000008c20f000 (reserved)
(XEN)  000000008c20f000 - 000000008c281000 (usable)
(XEN)  000000008c281000 - 000000008dec1000 (reserved)
(XEN)  000000008dec1000 - 000000008df9a000 (ACPI NVS)
(XEN)  000000008df9a000 - 000000008dfff000 (ACPI data)
(XEN)  000000008dfff000 - 000000008e000000 (usable)
(XEN)  000000008e000000 - 0000000090000000 (reserved)
(XEN)  0000000094000000 - 000000009a000000 (reserved)
(XEN)  000000009df00000 - 00000000a0000000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000fd000000 - 00000000fe800000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fed00000 - 00000000fed01000 (reserved)
(XEN)  00000000fed10000 - 00000000fed1a000 (reserved)
(XEN)  00000000fed84000 - 00000000fed85000 (reserved)
(XEN)  00000000fee00000 - 00000000fee01000 (reserved)
(XEN)  00000000ff400000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000001060000000 (usable)
(XEN) New Xen image base address: 0x8ba00000
(XEN) ACPI: RSDP 000F0510, 0024 (r2 INTEL )
(XEN) ACPI: XSDT 8DFB7188, 00EC (r1 INTEL  S1200SPO        0 INTL  1000013)
(XEN) ACPI: FACP 8DFF3000, 00F4 (r5 INTEL  S1200SPO        0 INTL 20091013)
(XEN) ACPI: DSDT 8DFC3000, 29241 (r2 INTEL  S1200SPO        0 INTL 20091013)
(XEN) ACPI: FACS 8DF6D000, 0040
(XEN) ACPI: HPET 8DFF2000, 0038 (r1 INTEL  S1200SPO        1 INTL 20091013)
(XEN) ACPI: APIC 8DFF1000, 00BC (r3 INTEL  S1200SPO        1 INTL 20091013)
(XEN) ACPI: MCFG 8DFF0000, 003C (r1 INTEL  S1200SPO        1 INTL 20091013)
(XEN) ACPI: SPMI 8DFEE000, 0042 (r5 INTEL  S1200SPO        0 INTL 20091013)
(XEN) ACPI: WDDT 8DFED000, 0040 (r1 INTEL  S1200SPO        0 INTL 20091013)
(XEN) ACPI: SSDT 8DFC0000, 2BAE (r2 INTEL  S1200SPO     1000 INTL 20091013)
(XEN) ACPI: SSDT 8DFBF000, 0BE3 (r2 INTEL  S1200SPO     1000 INTL 20091013)
(XEN) ACPI: SSDT 8DFBE000, 019A (r2 INTEL  S1200SPO     1000 INTL 20091013)
(XEN) ACPI: SSDT 8DFBD000, 04A3 (r2 INTEL  S1200SPO     1000 INTL 20091013)
(XEN) ACPI: TCPA 8DFFC000, 0064 (r2 INTEL  S1200SPO        2 INTL  1000013)
(XEN) ACPI: TPM2 8DFFA000, 0034 (r3 INTEL  S1200SPO        2 INTL  1000013)
(XEN) ACPI: SSDT 8DFF4000, 5328 (r2 INTEL  S1200SPO     3000 INTL 20141107)
(XEN) ACPI: SSDT 8DFBC000, 0E73 (r2 INTEL  S1200SPO     3000 INTL 20141107)
(XEN) ACPI: SSDT 8DFBA000, 0064 (r2 INTEL  S1200SPO        2 INTL 20141107)
(XEN) ACPI: DMAR 8DFB8000, 0070 (r1 INTEL  S1200SPO        1 INTL        1)
(XEN) ACPI: HEST 8DFFD000, 00A8 (r1 INTEL  S1200SPO        1 INTL        1)
(XEN) ACPI: ERST 8DFB5000, 0230 (r1 INTEL  S1200SPO        1 INTL        1)
(XEN) ACPI: SSDT 8DFFB000, 03A7 (r2 INTEL  S1200SPO     1000 INTL 20141107)
(XEN) ACPI: SSDT 8DFBB000, 0B79 (r2 INTEL  S1200SPO        2 INTL 20141107)
(XEN) ACPI: BERT 8DFB6000, 0030 (r1 INTEL  S1200SPO        1 INTL        1)
(XEN) ACPI: UEFI 8DF82000, 0042 (r1 INTEL  S1200SPO        2 INTL  1000013)
(XEN) ACPI: PRAD 8DFB9000, 0102 (r2 INTEL  S1200SPO        2 INTL 20141107)
(XEN) ACPI: EINJ 8DFB4000, 0130 (r1 INTEL  S1200SPO        1 INTL        1)
(XEN) ACPI: SPCR 8DFEF000, 0050 (r1 INTEL  S1200SPO        0 INTL 20091013)
(XEN) System RAM: 65217MB (66783036kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000001060000000
(XEN) Domain heap initialised
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 158 (0x9e), Stepping 9 (raw 000906e9)
(XEN) DMI 2.7 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x1808 (32 bits)
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:1804,1:0], pm1x_evt[1:1800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 8df6d000/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[8df6d00c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x01] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x03] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x05] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
(XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) [VT-D]Host address width 39
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = fed90000
(XEN) [VT-D]drhd->address = fed90000 iommu->reg = ffff82c00021b000
(XEN) [VT-D]cap = d2008c40660462 ecap = f050da
(XEN) [VT-D] IOAPIC: 0000:f0:1f.0
(XEN) [VT-D] MSI HPET: 0000:00:1f.0
(XEN) [VT-D]  flags: INCLUDE_ALL
(XEN) [VT-D]found ACPI_DMAR_RMRR:
(XEN) [VT-D]  RMRR address range 3e2e0000..3e2fffff not in reserved memory; need "iommu_inclusive_mapping=1"?
(XEN) [VT-D] endpoint: 0000:00:14.0
(XEN) [VT-D]dmar.c:638:   RMRR region: base_addr 3e2e0000 end_addr 3e2fffff
(XEN) Xen ERST support is initialized.
(XEN) HEST: Table parsing has been initialized
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 8 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 1432 MSI/MSI-X
(XEN) Not enabling x2APIC (upon firmware request)
(XEN) xstate: size: 0x440 and states: 0x1f
(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, CMCI
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK
(XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: No, Other:
(XEN)   Support for VMs: PV: RSB EAGER_FPU, HVM: RSB EAGER_FPU
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Platform timer is 23.999MHz HPET
(XEN) Detected 3792.189 MHz processor.
(XEN) Initing memory sharing.
(XEN) alt table ffff82d080465858 -> ffff82d08046759a
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d Snoop Control enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 64 KiB.
(XEN) mwait-idle: MWAIT substates: 0x142120
(XEN) mwait-idle: v0.4.1 model 0x9e
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Brought up 8 CPUs
(XEN) build-id: 217e72f0df3db05d72d6fa8b460b643bad6c230e
(XEN) Running stub recovery selftests...
(XEN) traps.c:1570: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d08037b412
(XEN) traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d08037b412
(XEN) traps.c:1097: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d08037b412
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 888 PIRQs
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PVH Dom0 ***
(XEN) [VT-D]d0:Hostbridge: skip 0000:00:00.0 map
(XEN) [VT-D]d0:PCI: map 0000:00:14.0
(XEN) [VT-D]d0:PCI: map 0000:00:14.2
(XEN) [VT-D]d0:PCI: map 0000:00:16.0
(XEN) [VT-D]d0:PCI: map 0000:00:16.1
(XEN) [VT-D]d0:PCI: map 0000:00:17.0
(XEN) [VT-D]d0:PCI: map 0000:00:1f.0
(XEN) [VT-D]d0:PCI: map 0000:00:1f.2
(XEN) [VT-D]d0:PCI: map 0000:00:1f.4
(XEN) [VT-D]d0:PCIe: map 0000:01:00.0
(XEN) [VT-D]d0:PCIe: map 0000:02:00.0
(XEN) [VT-D]d0:PCIe: map 0000:03:00.0
(XEN) [VT-D]d0:PCIe: map 0000:04:00.0
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c00021b000
(XEN) WARNING: PVH is an experimental mode with limited functionality
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs
(XEN) ...................................................................................................................................done.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) This option is intended to aid debugging of Xen by ensuring
(XEN) that all output is synchronously delivered on the serial line.
(XEN) However it can introduce SIGNIFICANT latencies and affect
(XEN) timekeeping. It is NOT recommended for production use!
(XEN) ***************************************************
(XEN) 3... 2... 1... 
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 468kB init memory
(XEN) [VT-D]iommu.c:919: iommu_fault_status: Fault Overflow
(XEN) [VT-D]iommu.c:921: iommu_fault_status: Primary Pending Fault
(XEN) [VT-D]DMAR:[DMA Write] Request device [0000:00:14.0] fault addr 8deb3000, iommu reg = ffff82c00021b000
(XEN) [VT-D]DMAR: reason 05 - PTE Write access is not set
(XEN) print_vtd_entries: iommu #0 dev 0000:00:14.0 gmfn 8deb3
(XEN)     root_entry[00] = 1021c60001
(XEN)     context[a0] = 2_1021d6d001
(XEN)     l4[000] = 9c00001021d6c107
(XEN)     l3[002] = 9c00001021d3e107
(XEN)     l2[06f] = 9c000010218c0107
(XEN)     l1[0b3] = 8000000000000000
(XEN)     l1[0b3] not present
(XEN) Dom0 callback via changed to Direct Vector 0xf3

--------------4B21B857BDD1ABAFFAF068FF
Content-Type: text/x-log; name="cpuinfo.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cpuinfo.log"

cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 800.031
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 799.716
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 800.285
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 4
initial apicid	: 4
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 800.068
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 6
initial apicid	: 6
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 4
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 801.970
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 5
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 800.277
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 6
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 800.104
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 5
initial apicid	: 5
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 7
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Xeon(R) CPU E3-1270 v6 @ 3.80GHz
stepping	: 9
microcode	: 0x5e
cpu MHz		: 800.171
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 7
initial apicid	: 7
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
bogomips	: 7584.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

--------------4B21B857BDD1ABAFFAF068FF
Content-Type: text/x-log; name="grub.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="grub.log"

cat /etc/default/grub 
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT=""
GRUB_CMDLINE_LINUX="console=tty0,115200n8 console=tty1,115200n8 console=ttyS0,115200n8 console=ttyS1,115200n8"
GRUB_CMDLINE_XEN="dom0=pvh dom0_mem=4096M loglvl=all sync_console console_to_ring=true console=com1,vga com1=115200,8n1 iommu=debug,verbose,workaround_bios_bug iommu_inclusive_mapping=true"

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
#GRUB_GFXMODE=640x480

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
#GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"

--------------4B21B857BDD1ABAFFAF068FF
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------4B21B857BDD1ABAFFAF068FF--
