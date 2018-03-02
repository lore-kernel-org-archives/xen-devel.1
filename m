From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 6/6] xen/arm: disable CPUs with different
 cacheline sizes
Date: Fri, 2 Mar 2018 18:31:40 +0000
Message-ID: <12674c97-344c-261a-fae6-0b755cc6acfa@citrix.com>
References: <alpine.DEB.2.10.1803011524530.4239@sstabellini-ThinkPad-X260>
 <1519946795-7191-1-git-send-email-sstabellini@kernel.org>
 <1519946795-7191-6-git-send-email-sstabellini@kernel.org>
 <eefdee3b-9a35-d758-51ce-bdb15a287dbc@arm.com>
 <alpine.DEB.2.10.1803021025000.4239@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1803021025000.4239@sstabellini-ThinkPad-X260>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTg6MjYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPgo+Pj4gU3VnZ2Vz
dGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4gU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+Pj4KPj4+
IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2MzoKPj4+IC0gbmV3IHBhdGNoCj4+Pgo+Pj4gLS0tCj4+PiBJ
bnRlcmVzdGluZ2x5IEkgY291bGRuJ3QgZmluZCBhIGJldHRlciB3YXkgaW4gQzg5IHRvIHByaW50
ayBhIHNpemVfdAo+Pj4gdGhhbiBjYXN0aW5nIGl0IHRvIHVuc2lnbmVkIGxvbmcuCj4+IFlvdSBj
YW4gdXNlICV6dS4KPiBJdCdzIEM5OSBvbmx5IDotKAoKU29ycnkgZm9yIHRoZSBpbnRlcmplY3Rp
b24sIGJ1dCB3aGF0IGhhcyBDODkgZ290IHRvIGRvIHdpdGggYW55dGhpbmc/wqAKWGVuIHVzZXMg
LXN0ZD1nbnU5OSwgYXMgcGVyIHRoZSByb290IENvbmZpZy5tayBmaWxlLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
