From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with Linus' tree
Date: Thu, 15 Feb 2018 17:55:45 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802151754040.5392@sstabellini-ThinkPad-X260>
References: <20180216120432.2f4e9c89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216120432.2f4e9c89@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: xen-devel@lists.xenproject.org

On Fri, 16 Feb 2018, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xen-tip tree got a conflict in:
> 
>   drivers/xen/pvcalls-front.c
> 
> between commit:
> 
>   a9a08845e9ac ("vfs: do bulk POLL* -> EPOLL* replacement")
> 
> from Linus' tree and commit:
> 
>   1e7dbff356e5 ("pvcalls-front: introduce a per sock_mapping refcount")
> 
> from the xen-tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Stephen,

it looks good.

Cheers,

Stefano


> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/xen/pvcalls-front.c
> index 753d9cb437d0,ca5b77309c7d..000000000000
> --- a/drivers/xen/pvcalls-front.c
> +++ b/drivers/xen/pvcalls-front.c
> @@@ -963,20 -942,13 +942,13 @@@ __poll_t pvcalls_front_poll(struct fil
>   {
>   	struct pvcalls_bedata *bedata;
>   	struct sock_mapping *map;
>  -	int ret;
>  +	__poll_t ret;
>   
> - 	pvcalls_enter();
> - 	if (!pvcalls_front_dev) {
> - 		pvcalls_exit();
> + 	map = pvcalls_enter_sock(sock);
> + 	if (IS_ERR(map))
>  -		return POLLNVAL;
>  +		return EPOLLNVAL;
> - 	}
>   	bedata = dev_get_drvdata(&pvcalls_front_dev->dev);
>   
> - 	map = (struct sock_mapping *) sock->sk->sk_send_head;
> - 	if (!map) {
> - 		pvcalls_exit();
> - 		return EPOLLNVAL;
> - 	}
>   	if (map->active_socket)
>   		ret = pvcalls_front_poll_active(file, bedata, map, wait);
>   	else
> 
