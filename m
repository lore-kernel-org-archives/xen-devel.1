From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 3/7] libxl: introduce a new structure to
 represent static shared memory regions
Date: Tue, 6 Feb 2018 15:46:53 +0000
Message-ID: <2c8368e3-382f-b8ba-6102-14d1de3e1174@arm.com>
References: <20180130175024.26921-1-blackskygg@gmail.com>
 <20180130175024.26921-4-blackskygg@gmail.com>
 <0b456f77-09a3-5874-2022-7a6df6930f0d@arm.com>
 <CAHrd_jrSZ1TWmHzOqYvrbkvioyH_GBEHq09ObB3s+p-uSus6qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAHrd_jrSZ1TWmHzOqYvrbkvioyH_GBEHq09ObB3s+p-uSus6qw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhongze Liu <blackskygg@gmail.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMi8wNi8yMDE4IDAzOjQxIFBNLCBaaG9uZ3plIExpdSB3cm90ZToKPiBUaGFua3Mg
Zm9yIHJldmlld2luZy4KPiAKPiAyMDE4LTAyLTA2IDE5OjI3IEdNVCswODowMCBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjoKPj4gSGksCj4+Cj4+IE9uIDAxLzMwLzIwMTggMDU6
NTAgUE0sIFpob25nemUgTGl1IHdyb3RlOgo+Pj4KPj4+IEFkZCBhIG5ldyBzdHJ1Y3R1cmUgdG8g
dGhlIElETCBmYW1pbGl5IHRvIHJlcHJlc2VudCBzdGF0aWMgc2hhcmVkIG1lbW9yeQo+Pj4gcmVn
aW9ucwo+IAo+IFsuLi5dCj4gCj4+PiArbGlieGxfc3RhdGljX3NobSA9IFN0cnVjdCgic3RhdGlj
X3NobSIsIFsKPj4+ICsgICAgKCJpZCIsIHN0cmluZyksCj4+PiArICAgICgib2Zmc2V0IiwgdWlu
dDY0LCB7J2luaXRfdmFsJzogJ0xJQlhMX1NTSE1fUkFOR0VfVU5LTk9XTid9KSwKPj4+ICsgICAg
KCJiZWdpbiIsIHVpbnQ2NCwgeydpbml0X3ZhbCc6ICdMSUJYTF9TU0hNX1JBTkdFX1VOS05PV04n
fSksCj4+PiArICAgICgiZW5kIiwgdWludDY0LCB7J2luaXRfdmFsJzogJ0xJQlhMX1NTSE1fUkFO
R0VfVU5LTk9XTid9KSwKPj4KPj4KPj4gV2UgbWlnaHQgd2FudCB0byBzdG9yZSB0aGUgc2l6ZSBy
YXRoZXIgdGhhbiB0aGUgZW5kLiBUaGlzIHdvdWxkIGFsbG93IHVzIHRvCj4+IGNvdmVyIHJlZ2lv
biB1cCB0byB0aGUgYWRkcmVzcyAyXjY0LTEuCj4+Cj4+IEFsc28sIHRoaXMgd291bGQgbWFrZSBj
bGVhcmVyIHdoZXRoZXIgZW5kIGlzIGluY2x1ZGVkIGluIHRoZSByZWdpb24gb3Igbm90Lgo+Pgo+
IAo+IEkgdGhpbmsgbWFraW5nIHRoZSByYW5nZSBpbmNsdXNpdmUgYW5kIGRvY3VtZW50aW5nIGl0
IHdvdWxkIGhhdmUgdGhlCj4gc2FtZSBlZmZlY3QuCj4gQnV0IEknbSBub3Qgc3VyZSB3aGljaCBz
eW50YXggaXMgbW9yZSBmcmllbmRseSB0byB0aGUgdXNlcnMuIFdoYXQgZG8geW91IHRoaW5rPwoK
WW91IHdvdWxkIHN0aWxsIHJ1biBpbnRvIHNvbWUgcHJvYmxlbS4gSW5kZWVkIExJQlhfU1NITV9S
QU5HRV9VTktOT1dOIGlzIApkZWZpbmVkIGFzIFVJTlQ2NF9NQVguIFNvIGhvdyB3b3VsZCB5b3Ug
ZGlmZmVyZW50aWF0ZSB0aGVtPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
