From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/4] libx86: Introduce
 x86_cpuid_lookup_vendor()
Date: Tue, 26 Mar 2019 15:47:30 +0100
Message-ID: <750355ca-cf00-92aa-3417-1c582f504828@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
References: =?UTF-8?B?PDE1NTMxNzA4Njbvv70yMzgxMu+/vTHvv71naXTvv71zZW5k77+9?=
 =?UTF-8?B?ZW1haWzvv71hbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiA8MTU1MzE3MDg2Ng==?=
 =?UTF-8?B?77+9MjM4MTLvv70y77+9Z2l077+9c2VuZO+/vWVtYWls77+9YW5kcmV3LmNvb3Bl?=
 =?UTF-8?Q?r3=40citrix=2ecom=3e_=3c5C9A12690200007800221E05=40prv1=ef=bf=bdm?=
 =?UTF-8?B?aC5wcm92by5ub3ZlbGwuY29tPiA8YzVkMWRmM2Tvv70wMzhk77+9OGMwYe+/vTk3?=
 =?UTF-8?Q?da=ef=bf=bda71f8f3fd009=40citrix=2ecom=3e_=3c5C9A320A020000780022?=
 =?UTF-8?B?MUVGRkBwcnYx77+9bWgucHJvdm8ubm92ZWxsLmNvbT4gPDNhNTA0Y2U5LTljYWQt?=
 =?UTF-8?Q?f2a3-4ed5-bd42b114ee06=40suse=2ecom=3e_=3c5C9A39B00200007800221F2?=
 =?UTF-8?B?M0BzdXNlLmNvbT4=?=
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Xen-devel <xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDMvMjAxOSAxNTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMDMuMTkg
YXQgMTU6MjMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJTU8gZXNwZWNpYWxseSBpbiB0
aGUgQ1BVSUQgY2FzZSBpdCBpcyBkZXNpcmFibGUgdG8gZXhwbGljaXRseSBzcGVjaWZ5Cj4+IHRo
ZSB3aWR0aCBvZiB0aGUgZGF0YS4gTG9va2luZyBhdCBub2RlcyAweDgwMDAwMDAyIGFuZCBmb2xs
b3dpbmcgdGhpcwo+PiBzaG91bGQgYmUgcmF0aGVyIGNsZWFyIChhbmQgSSBldmVuIHRoaW5rIGdl
dF9tb2RlbF9uYW1lKCkgc2hvdWxkIGJlCj4+IG1vZGlmaWVkIHRvIHVzZSBhIHBvaW50ZXIgdG8g
dWludDMyX3QgaW5zdGVhZCBvZiB1bnNpZ25lZCBpbnQpLiBVc2luZwo+PiBhIHR5cGUgd2l0aCBz
aXplID49IDQgZG9lc24ndCBmaXQgcmVhbGx5IHdlbGwuIFlvdSB3YW50IHNpemUgPT0gNC4KPiAK
PiBXaHk/IEZpeGVkIHdpZHRoIHR5cGVzIG9ubHkgaW50cm9kdWNlIHVubmVjZXNzYXJ5IHJlc3Ry
aWN0aW9ucwo+IHdoZW4gd2FudGluZyB0byByZS11c2UgY29kZSBpbiBvdGhlciBlbnZpcm9ubWVu
dHMuIEFuZCBJIGRvbid0Cj4gc2VlIHdoeSBDUFVJRCBub2RlcyAweDgwMDAwMDBbMjM0XSB3b3Vs
ZCBiZSBhbnkgYmV0dGVyIChvcgo+IHdvcnNlKSBhcyBhbiBleGFtcGxlIGhlcmUuIElmIGFueXRo
aW5nIHRoZXkgdGVsbCB1cyB0aGF0IG5laXRoZXIKPiB1aW50MzJfdCBub3IgdW5zaWduZWQgaW50
IGFyZSByaWdodCwgYW5kIGl0IHNob3VsZCBiZSBjaGFyWzRdIG9yCj4gdWludDhfdFs0XSBpbnN0
ZWFkIChkZXBlbmRpbmcgb24gd2hldGhlciB3ZSB3YW50IHRvIHRpZQo+IG91cnNlbHZlcyB0byBD
SEFSX0JJVCA9PSA4LCB3aGljaCBjbGVhcmx5IGlzIG1vcmUgcmVzdHJpY3RpdmUKPiB0aGFuIHNp
emVvZihpbnQpID49IDQsIGJ1dCBvdG9oIGlzIGFsc28gbGVzcyBsaWtlbHkgdG8gZ2V0IGluIHRo
ZQo+IHdheSkuCgpZb3UgYXJlIHVzaW5nIGEgbGl0dGxlIGVuZGlhbiBzcGVjaWZpYyBwb2ludCBv
ZiB2aWV3LiBUaGF0J3MgdGhlIG9ubHkKcmVhc29uIHRoZSBjdXJyZW50IGNvZGUgd291bGQgd29y
ayB3aXRoIGEgbm9uLWZpeGVkIHdpZHRoIHNwZWNpZmljYXRpb24uCgpUaGUgY2hhcls0XSB2YXJp
YW50IHdvdWxkIHdvcmsgb25seSB3aXRoIGEgdW5pb24gd2hlcmUgdGhlIG90aGVyIG1lbWJlcgp3
b3VsZCBuZWVkIHRvIGJlIGEgZml4ZWQgd2lkdGggdHlwZSBsaWtlIHVpbnQzMl90LgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
