From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Upping gcc requirement for x86
Date: Fri, 30 Mar 2018 11:11:55 -0500
Message-ID: <3e261058-4939-41c2-1c74-17a4ef8c082d@cardoe.com>
References: <20180329154523.nvxkzn5rhetphwki@citrix.com>
 <CAFLBxZZJX1DPv-M8n_CDFf7OWfxmBwtXC9eDQb_WRXz9V5TYyA@mail.gmail.com>
 <0f8d92f1-9be1-88cb-6711-02e1099b069b@cardoe.com>
 <CAFLBxZYsHk2_soi7k-56medAyP_DyCyHxRhsFG4o0iuiGJmHEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eune=gu=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1f1wdE-0001vf-A2
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 16:12:00 +0000
Received: by mail-qt0-x241.google.com with SMTP id s48so9796543qtb.10
 for <xen-devel@lists.xenproject.org>; Fri, 30 Mar 2018 09:11:58 -0700 (PDT)
In-Reply-To: <CAFLBxZYsHk2_soi7k-56medAyP_DyCyHxRhsFG4o0iuiGJmHEg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMy8zMC8xOCAzOjUwIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIFRodSwgTWFyIDI5
LCAyMDE4IGF0IDY6NDcgUE0sIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4gd3Jv
dGU6Cj4+IE9uIDMvMjkvMTggMTI6MDUgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiBU
aHUsIE1hciAyOSwgMjAxOCBhdCA0OjQ1IFBNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PiB3cm90ZToKPj4+Cj4+PiBMb25nIHRlcm0gSSB0aGluayB3ZSB3YW50IHRvIGdldCBhd2F5IGZy
b20gYnVpbGRpbmcgc2VhYmlvcyBvdXJzZWx2ZXMKPj4+IGFsdG9nZXRoZXI7IGJ1dCBpdCdzIGEg
Yml0IGxhdGUgaW4gdGhlIHJlbGVhc2UgY3ljbGUgdG8gd29yayBvdXQgdGhhdAo+Pj4ga2luZCBv
ZiBjaGFuZ2UuCj4+Pgo+Pj4gT24gdGhlIHdob2xlIEknZCBwcm9iYWJseSBnbyB3aXRoICMzIGF0
IHRoaXMgcG9pbnQuCj4+Pgo+Pj4gIC1HZW9yZ2UKPj4+Cj4+Cj4+IFZpb2xlbnQgYWdyZWVtZW50
IGhlcmUuIEV2ZXJ5IGRpc3RybyB3YW50cyB0byBzZWUgdGhpcyBzbyB0aGV5IGNhbiBzaGFyZQo+
PiB0aGVzZSBibG9icy4gSXRzIHdoYXQgbGVhZCB0byB0aGUgY2hhbmdlIHRvIHRyYWNraW5nIHRh
Z3MgaW4KPj4gM2RkOTI2YTI1ZDg2NjM2NGNlNmQ0NmMyMWY5YWMwNWE4MmZhN2ZmYiBvcmlnaW5h
bGx5Lgo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIC0tIEFGQUlLIHRoZXJl
J3Mgbm8gKmRlcGVuZGVuY3kqIGZyb20KPiBYZW4gdG8gYW55IHBhcnRpY3VsYXIgdmVyc2lvbiBv
ZiBTZWFCSU9TICh1bmxpa2UgUUVNVSkuICBJZiAxLjkgd29uJ3QKPiBjb21waWxlIHdpdGggZ2Nj
IDQuNCwgYnV0IDEuOCBkb2VzLCB3ZSBjYW4ganVzdCBwb2ludCB0aGUgdGFnIHRvIDQuNC4KPiBE
aXN0cm9zIHdpbGwgYmUgY29tcGlsaW5nIHRoZWlyIG93biBTZWFCSU9TIHZlcnNpb25zIGFueXdh
eSwgbm8/Cj4gCj4gT3IgYW0gSSBtaXNzaW5nIHlvdXIgcG9pbnQgc29tZWhvdz8KPiAKPiAgLUdl
b3JnZQo+IAoKTXkgcG9pbnQgd2FzIHdlIGV4cGxpY2l0bHkgbW92ZWQgdG8gdGVzdGluZy9zaGlw
cGluZyB0YWdzIHNvIHRoYXQgd2UKZGlzdHJvcyBjb3VsZCBzYXkgIm9oIHRoaXMgaXMgd2hhdCB0
aGUgWGVuIGZvbGtzIHRlc3RlZCB3aXRoIEkgaGF2ZQpjb25maWRlbmNlIHRoYXQgaWYgd2Ugc2hp
cCB0aGUgc2FtZSB2ZXJzaW9uIGl0IHNob3VsZCB3b3JrIGZvciB1c2VycyIuCgpJIHRoaW5rIHdl
IHdhbnQgdG8gZ2V0IGF3YXkgZnJvbSBidWlsZGluZyBpdCBvdXJzZWx2ZXMgYW5kIGRlZmF1bHRp
bmcgdG8KdGVsbGluZyBkaXN0cm9zIHRoZXkgbmVlZCB0byBwcm92aWRlIGl0LgoKLS0gCkRvdWcg
R29sZHN0ZWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
