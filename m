From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] libx86: Split
 x86_cpuid_policy_fill_native() out of calculate_raw_policy()
Date: Fri, 9 Nov 2018 16:26:35 +0000
Message-ID: <fcdb8c82-77a5-2d1b-c6b5-12f01d21f441@citrix.com>
References: <1541416867-30253-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416867-30253-3-git-send-email-andrew.cooper3@citrix.com>
 <20181106163124.jgzherf7rqogteb4@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181106163124.jgzherf7rqogteb4@mac.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTEvMTggMTY6MzEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MDUsIDIwMTggYXQgMTE6MjE6MDNBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhp
cyB3aWxsIHNob3J0bHkgYmUgd2FudGVkIGJ5IHRoZSB1c2Vyc3BhY2UgZW11bGF0b3IgaGFybmVz
c2VzIGFzIHdlbGwuCj4+Cj4+IENvbnNvbGlkYXRlIHRoZSBjcHVpZHssX2NvdW50fV9sZWFmKCkg
aGVscGVycyBiZXNpZGUgdGhlIHN0cnVjdHVyZSBkZWZpbml0aW9uLAo+PiByYXRoZXIgdGhhbiBo
YXZpbmcgdGhlbSBzY2F0dGVyZWQgdGhyb3VnaG91dCBYZW4uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Cj4gSSdtIHNsaWdodGx5
IHdvcnJpZWQgYWJvdXQgdGhlIF9uYXRpdmUgcHJlZml4IGluIHRoZSBmdW5jdGlvbiBuYW1lLCBp
Zgo+IHRoaXMgaXMgcnVuIG9uIERvbTAgdXNlcnNwYWNlIHRoZSBfbmF0aXZlIHBhcnQgb2YgdGhp
cyBpcyBkdWJpb3VzLAo+IHNpbmNlIHRoZSBwb2xpY3kgcmV0dXJuZWQgaXMgZ29pbmcgdG8gYmUg
cHJvdmlkZWQgYnkgWGVuLCBhbmQgdGh1cwo+IG1pZ2h0IG5vdCBtYXRjaCB0aGUgaG9zdCBvbmUu
IEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBuYW1lCj4gcmVjb21tZW5kYXRpb24sIHNvIEknbSBmaW5l
IHdpdGggdGhpcy4KCldlbGwgLSBpdCBpcyBhIG5hdGl2ZSBpbnN0cnVjdGlvbiwgd2hldGhlciBv
ciBub3QgdGhlcmUgaXMgYSBvdXRlcgpoeXBlcnZpc29yIG9yIG1hc2tpbmcvZmF1bHRpbmcgY29u
ZmlndXJhdGlvbiBwbGF5aW5nIHdpdGggdGhlIHZhbHVlcyBzZWVuLgoKSSdsbCBzZWUgYWJvdXQg
bWVudGlvbmluZyB0aGlzIGluIHRoZSBmdW5jdGlvbiBkb2N1bWVudGF0aW9uLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
