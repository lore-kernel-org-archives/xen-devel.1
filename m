From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 4/7] xen/arm32: Add skeleton to harden
 branch predictor aliasing attacks
Date: Wed, 31 Jan 2018 15:29:30 +0000
Message-ID: <e146fe16-5998-82e8-0722-952e4823582c@linaro.org>
References: <20180119134103.3390-1-julien.grall@linaro.org>
 <20180119134103.3390-5-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801241545580.6440@sstabellini-ThinkPad-X260>
 <bc492613-35a6-57ad-41e4-b024429549eb@linaro.org>
 <alpine.DEB.2.10.1801251042590.11958@sstabellini-ThinkPad-X260>
 <be044a8e-aa82-ffbe-3b6e-386ce5d91177@linaro.org>
 <alpine.DEB.2.10.1801251136070.11958@sstabellini-ThinkPad-X260>
 <ec7f0351-372f-cbfc-1a9b-7b203d5eb0e0@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ec7f0351-372f-cbfc-1a9b-7b203d5eb0e0@linaro.org>
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
Cc: andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNi8wMS8xOCAxNjoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAiVGhlcmVmb3JlIGh5
cGVydmlzb3IgY29kZSBydW5uaW5nIHdpdGggZ3Vlc3QgdmVjdG9ycyB0YWJsZSBzaG91bGQgYmUK
Pj4gbWluaW1pemVkIGFuZCBhbHdheXMgaGF2ZSBpbnRlcnJ1cHRzIGFuZCBhc3luYyBhYm9ydHMg
bWFza2VkIHRvIHJlZHVjZQo+PiB0aGUgcmlzayB0byB1c2UgdGhlbS4iCj4+Cj4+IERvIHlvdSB0
aGluayB0aGF0IGl0IGlzIGNsZWFyZXI/Cj4gCj4gV2VsbCwgdGhhdCB3YXMgY292ZXJlZCBieSAi
aW50ZXJydXB0cyIuIElmIHlvdSBsb29rIGF0IHRoZSBBcm0gQXJtLCBBLCAKPiBJLCBGIGFyZSBj
b25zaWRlcmVkIGFsbCBpbnRlcnJ1cHRzLgoKSSByZXdvcmtlZCB0aGUgcGFyYWdyYXBoIGFuZCBp
dCBpcyBub3c6CgoiSG93ZXZlciwgb24gYXJtMzIsIGVhY2ggdmVjdG9yIGNvbnRhaW4gYSBzaW5n
bGUgaW5zdHJ1Y3Rpb24uIFRoaXMgbWVhbnMgCnRoYXQgdGhlIGhhcmRlbmVkIHZlY3RvciB0YWJs
ZXMgbWF5IHJlbHkgb24gdGhlIHN0YXRlIG9mIHJlZ2lzdGVycyB0aGF0IApkb2VzIG5vdCBob2xk
IHdoZW4gaW4gdGhlIGh5cGVydmlzb3IgKGUuZyBTUCBpcyA4IGJ5dGVzIGFsaWduZWQpLiAKVGhl
cmVmb3JlIGh5cGVydmlzb3IgY29kZSBydW5uaW5nIHdpdGggZ3Vlc3QgdmVjdG9ycyB0YWJsZSBz
aG91bGQgYmUKbWluaW1pemVkIGFuZCBhbHdheXMgaGF2ZSBJUlEgYW5kIFNFcnJvciBtYXNrZWQg
dG8gcmVkdWNlIHRoZSByaXNrIHRvIAp1c2UgdGhlbS4iCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
