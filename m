From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/boot: Don't leak the module_map
 allocation in __start_xen()
Date: Mon, 15 Apr 2019 09:04:50 +0100
Message-ID: <7c8ac899-5180-9771-19cb-c4a06feeb137@citrix.com>
References: <1555096630-22406-1-git-send-email-andrew.cooper3@citrix.com>
 <5CB438FF02000078001553CC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5CB438FF02000078001553CC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org, wei.liu2@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDQvMjAxOSAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gMDQvMTIvMTkgOToxNyBQTSA+Pj4KPj4gRXZl
ciBzaW5jZSBpdHMgaW50cm9kdWNpb24gaW4gYy9zIDQzNmZiNDYyICJ4ODYvbWljcm9jb2RlOiBl
bmFibGUgYm9vdAo+PiB0aW1lIChwcmUtRG9tMCkgbG9hZGluZyIsIHRoZSBhbGxvY2F0aW9uIGhh
cyBnb25lIHVuLWZyZWVkLCBhbmQgaGFzIGl0cyBmaW5hbAo+PiB1c2UgYXMgcGFydCBvZiBjb25z
dHJ1Y3RpbmcgZG9tMC4KPj4KPj4gWGVuIGFscmVhZHkgY29uc2lkZXJlcyBpdCBhbiBlcnJvciB0
byBoYXZlIG1vcmUgdGhhbiBhIHNpbmdsZSB1bmFjY291bnRlZC1mb3IKPj4gbW9kdWxlIChhZ2Fp
biwgbG9naWMgZnJvbSB0aGUgc2FtZSBjaGFuZ2UpLCBhbmQgd2lsbCBvbmx5IHBhc3MgdGhlIGZp
cnN0IG9uZQo+PiB0byBkb20wIGFzIHRoZSBpbml0cmQuCj4+Cj4+IEluc3RlYWQgb2YgaGF2aW5n
IGFuIDggYnl0ZSBwb2ludGVyIHRvIGEgYml0bWFwIHdoaWNoIHdvbid0IGV4Y2VlZCA0IGJpdHMg
d2lkZQo+PiBpbiBhbnkgcHJvZHVjdGlvbiBzY2VuYXJpbyAoZG9tMCBrZXJuZWwsIGluaXRyZCwg
WFNNIGJsb2IgYW5kIG1pY3JvY29kZSBibG9iKSwKPj4gYWxsb2NhdGUgbW9kdWxlX21hcFtdIG9u
IHRoZSBzdGFjayBhbmQgYWRkIGEgc2FuaXR5IGJvdW5kIGZvciBtYmktPm1vZHNfY291bnQuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IEknbSBh
IGxpdHRsZSBjdXJpb3VzIGhvdyB5b3UgbWFuYWdlZCB0byBzcG90IHRoaXMgcHJldHR5IHNtYWxs
LCBvbmUtdGltZSBsZWFrIC4uLgoKSSB3YXMgbG9va2luZyBpbnRvIHRoZSBmZWFzaWJpbGl0eSBv
ZiBsb2FkaW5nIG1pY3JvY29kZSBlYXJsaWVyLCB3aGljaAppbnZvbHZlcyBub3QgaGF2aW5nIG1v
ZHVsZV9tYXAgdXNlIHhtYWxsb2NfYXJyYXkoKSwgd2hpY2ggaW4gdHVybgpoaWdobGlnaHRlZCB0
aGlzIGlzc3VlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
