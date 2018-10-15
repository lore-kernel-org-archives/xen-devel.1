From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/5] x86/boot: Initialise the debug
 registers correctly
Date: Mon, 15 Oct 2018 13:11:06 +0100
Message-ID: <18d38ac2-a94b-baf5-6108-5d8c3c7b2570@citrix.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-2-git-send-email-andrew.cooper3@citrix.com>
 <20181015112829.d6bjtjyvihkbjada@mac.bytemobile.com>
 <ef74b81b-0dd5-b933-c49b-1ca313bb1846@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ef74b81b-0dd5-b933-c49b-1ca313bb1846@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTAvMTggMTI6NDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTUvMTAvMjAxOCAx
MzoyOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gTW9uLCBPY3QgMTUsIDIwMTggYXQg
MTE6MzY6MTZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IEluIHBhcnRpY3VsYXIs
IGluaXRpYWxpc2luZyAlZHI2IHdpdGggdGhlIHZhbHVlIDAgaXMgYnVnZ3ksIGJlY2F1c2Ugb24K
Pj4+IGhhcmR3YXJlIHN1cHBvcnRpbmcgVHJhbnNuYXRpb25hbCBNZW1vcnksIGl0IHdpbGwgY2F1
c2UgdGhlIHN0aWNreSBSVE0gYml0IHRvCj4+PiBiZSBhc3NlcnRlZCwgZXZlbiB0aG91Z2ggYSBk
ZWJ1ZyBleGNlcHRpb24gZnJvbSBhIHRyYW5zYWN0aW9uIGhhc24ndCBhY3R1YWxseQo+Pj4gYmVl
biBvYnNlcnZlZC4KPj4+Cj4+PiBNb3ZlIFg4Nl9EUjZfREVGQVVMVCBpbnRvIHg4Ni1kZWZucy5o
IGFsb25nIHdpdGggdGhlIG90aGVyIGFyY2hpdGVjdHVyYWwKPj4+IHJlZ2lzdGVyIGNvbnN0YW50
cywgYW5kIGludHJvZHVjZSBhIG5ldyBYODZfRFI3X0RFRkFVTFQuICBVc2UgdGhlIGV4aXN0aW5n
Cj4+PiB3cml0ZV9kZWJ1Z3JlZygpIGhlbHBlciwgcmF0aGVyIHRoYW4gb3BlbmNvZGVkIGlubGlu
ZSBhc3NlbWJseS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+IFdoYXQgYWJvdXQ6Cj4KPiBzL1RyYW5zbmF0aW9uYWwvVHJhbnNhY3Rpb25h
bC8KPgo+IE9yIGRpZCB5b3UgbWVhbiBpbnRlcm5hdGlvbmFsPyAoU0NOUikKCkkgZGlkIG1lYW4g
VHJhbnNhY3Rpb25hbCAoYnV0IGNvdWxkIGhhdmUgc3dvcm4gdGhhdCBJIGFscmVhZHkgZml4ZWQg
dGhpcwpzcGVjaWZpYyBtaXN0YWtlLsKgIE9idmlvdXNseSBub3QpLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
