From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/hvm: Adjust hvmemul_rep_stos() to
 compile with -Wvla
Date: Mon, 24 Sep 2018 14:20:58 +0100
Message-ID: <fa26f49c-1e10-362d-ec62-3d08a9f1a753@citrix.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-4-git-send-email-andrew.cooper3@citrix.com>
 <20180924132006.mkufwthiajqrsilf@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180924132006.mkufwthiajqrsilf@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDkvMTggMTQ6MjAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBTZXAgMjQsIDIwMTgg
YXQgMDI6MDA6MDFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRm9yIGF0IGxlYXN0
ICJnY2MgKFVidW50dSA1LjQuMC02dWJ1bnR1MX4xNi4wNC4xMCkgNS40LjAgMjAxNjA2MDkiLCB0
aGUKPj4gdHlwZWNhc3Qgb2YgYnVmIHRyaWdnZXJzIGEgVmFyaWFibGUgTGVuZ3RoIEFycmF5IHdh
cm5pbmcuCj4+Cj4+IEFsdGVyIHRoZSBhc20gZXhwcmVzc2lvbiB0byBhdm9pZCB0aGUgdHlwZWNh
c3QsIHdoaWNoIG5lY2Vzc2l0YXRlcyB0aGUKPj4gaW50cm9kdWN0aW9uIG9mIGEgbWVtb3J5IGNs
b2JiZXIgYXMgdGhlIGNvbXBpbGVyIGNhbiBubyBsb25nZXIgaWRlbnRpZnkKPj4gdGhlIHRvdGFs
IHF1YW50aXR5IG9mIHdyaXR0ZW4gbWVtb3J5Lgo+Pgo+PiBEZXNwaXRlIHRoZSBtZW1vcnkgY2xv
YmJlciwgdGhlcmUgaXMgbm8gY2hhbmdlIHRvIHRoZSBnZW5lcmF0ZWQuCj4gZ2VuZXJhdGVkIGFz
c2VtYmx5IGNvZGU/CgpZZWFoIC0gSSBhbHJlYWR5IG5vdGljZWQgYW5kIGZpeGVkIGl0IHVwIHRv
ICJnZW5lcmF0ZWQgYXNtLiIKClNlcnZlcyBtZSByaWdodCBmb3IgbGFzdCBtaW51dGUgZWRpdHMg
dG8gbXkgY29tbWl0IG1lc3NhZ2UuCgo+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpUaGFua3MsCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
